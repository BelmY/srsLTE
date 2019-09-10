/*
 * @Author: Gines Garcia Aviles
 *  -   github: @GinesGarcia
 *
 */

#include "srsenb/hdr/stack/mac/scheduler_harq.h"
#include <string.h>
#include <srsenb/hdr/stack/mac/scheduler_metric_slicing.h>

#define Error(fmt, ...)   log_h->error(fmt, ##__VA_ARGS__)
#define Warning(fmt, ...) log_h->warning(fmt, ##__VA_ARGS__)
#define Info(fmt, ...)    log_h->info(fmt, ##__VA_ARGS__)
#define Debug(fmt, ...)   log_h->debug(fmt, ##__VA_ARGS__)

namespace srsenb {

/*****************************************************************
 *
 * Downlink Metric
 *
 *****************************************************************/

void dl_metric_slicing::set_log(srslte::log* log_)
{
  log_h = log_;
}

void dl_metric_slicing::sched_users(std::map<uint16_t, sched_ue>& ue_db, sched::dl_tti_sched_t* tti_sched)
{
  typedef std::map<uint16_t, sched_ue>::iterator it_t;

  tti_alloc = tti_sched;

  if (ue_db.empty())
    return;

  // give priority in a time-domain RR basis
  uint32_t priority_idx = tti_alloc->get_tti_tx_dl() % (uint32_t)ue_db.size();
  it_t     iter         = ue_db.begin();
  std::advance(iter, priority_idx);
  for(uint32_t ue_count = 0 ; ue_count < ue_db.size() ; ++iter, ++ue_count) {
    if(iter==ue_db.end()) {
      iter = ue_db.begin(); // wrap around
    }
    sched_ue* user = &iter->second;
    allocate_user(user);
  }
}

bool dl_metric_slicing::find_allocation(uint32_t nof_rbg, rbgmask_t* rbgmask, uint16_t rnti)
{
    // Receives an initializes an empty mask to the maximum value.
    *rbgmask = ~(tti_alloc->get_dl_mask());

    //TODO: modified
    /*
    rbgmask_t mask_to_apply(17);
    for (uint32_t i = 0; i < 17; ++i) {
        if (i < 7){
            mask_to_apply.set(i);
        }
    }
    (*rbgmask) &= mask_to_apply;
    */

    // Apply the mask only if the rnti is assigned to a slice
    if (!assigned_slice.empty()){
        if (assigned_slice.find(rnti) != assigned_slice.end()){
            (*rbgmask) &= slices[assigned_slice[rnti]];
        }
    }

    uint32_t i = 0;
    for (; i < rbgmask->size() and nof_rbg > 0; ++i) {
        if (rbgmask->test(i)) {
            nof_rbg--;
        }
    }

    rbgmask->fill(i, rbgmask->size(), false);

    return nof_rbg == 0;

}

dl_harq_proc* dl_metric_slicing::allocate_user(sched_ue* user)
{
  if (tti_alloc->is_dl_alloc(user)) {
    return nullptr;
  }
  // FIXME: First do reTxs for all users. Only then do the rest.
  alloc_outcome_t code;
  uint32_t        tti_dl    = tti_alloc->get_tti_tx_dl();
  dl_harq_proc*   h         = user->get_pending_dl_harq(tti_dl);
  uint32_t        req_bytes = user->get_pending_dl_new_data_total(tti_dl);

  // Schedule retx if we have space
#if ASYNC_DL_SCHED
  if (h) {
#else
  if (h && !h->is_empty()) {
#endif
    // Try to reuse the same mask
    rbgmask_t retx_mask = h->get_rbgmask();
    code                = tti_alloc->alloc_dl_user(user, retx_mask, h->get_id());
    if (code == alloc_outcome_t::SUCCESS) {
      return h;
    } else if (code == alloc_outcome_t::DCI_COLLISION) {
      // No DCIs available for this user. Move to next
      return NULL;
    }

    //TODO: user tiene un parametro rnti que tendremos que pasar a find_allocation para poder sacar la mascara que le pertenece
    // If previous mask does not fit, find another with exact same number of rbgs
    size_t nof_rbg = retx_mask.count();
    if (find_allocation(nof_rbg, &retx_mask, user->get_rnti())) {
      code = tti_alloc->alloc_dl_user(user, retx_mask, h->get_id());
      if (code == alloc_outcome_t::SUCCESS) {
        return h;
      } else if (code == alloc_outcome_t::DCI_COLLISION) {
        return NULL;
      }
    }
  }

  // If could not schedule the reTx, or there wasn't any pending retx, find an empty PID
#if ASYNC_DL_SCHED
  h = user->get_empty_dl_harq();
  if (h) {
#else
    if (h && h->is_empty()) {
#endif
    // Allocate resources based on pending data
    if (req_bytes) {
      uint32_t  pending_rbg = user->prb_to_rbg(user->get_required_prb_dl(req_bytes, tti_alloc->get_nof_ctrl_symbols()));
      rbgmask_t newtx_mask(tti_alloc->get_dl_mask().size());
      find_allocation(pending_rbg, &newtx_mask, user->get_rnti());
      if (newtx_mask.any()) { // some empty spaces were found
        code = tti_alloc->alloc_dl_user(user, newtx_mask, h->get_id());
        if (code == alloc_outcome_t::SUCCESS) {
          return h;
        }
      }
    }
  }

  return NULL;
}

/*****************************************************************
 *
 * Uplink Metric 
 *
 *****************************************************************/

void ul_metric_slicing::set_log(srslte::log* log_)
{
  log_h = log_;
}

void ul_metric_slicing::sched_users(std::map<uint16_t, sched_ue>& ue_db, sched::ul_tti_sched_t* tti_sched)
{
  typedef std::map<uint16_t, sched_ue>::iterator it_t;

  tti_alloc   = tti_sched;
  current_tti = tti_alloc->get_tti_tx_ul();

  if(ue_db.size()==0)
      return;

  // give priority in a time-domain RR basis
  uint32_t priority_idx = (current_tti+(uint32_t)ue_db.size()/2) % (uint32_t)ue_db.size(); // make DL and UL interleaved

  // allocate reTxs first
  it_t iter = ue_db.begin();
  std::advance(iter, priority_idx);
  for(uint32_t ue_count = 0 ; ue_count < ue_db.size() ; ++iter, ++ue_count) {
    if(iter==ue_db.end()) {
      iter = ue_db.begin(); // wrap around
    }
    sched_ue* user = &iter->second;
    allocate_user_retx_prbs(user);
  }

  // give priority in a time-domain RR basis
  iter = ue_db.begin();
  std::advance(iter,priority_idx);
  for(uint32_t ue_count = 0 ; ue_count < ue_db.size() ; ++iter, ++ue_count) {
    if(iter==ue_db.end()) {
      iter = ue_db.begin(); // wrap around
    }
    sched_ue* user = &iter->second;
    allocate_user_newtx_prbs(user);
  }
}

/**
 * Finds a range of L contiguous PRBs that are empty
 * @param L Size of the requested UL allocation in PRBs
 * @param alloc Found allocation. It is guaranteed that 0 <= alloc->L <= L
 * @return true if the requested allocation of size L was strictly met
 */
bool ul_metric_slicing::find_allocation(uint32_t L, ul_harq_proc::ul_alloc_t* alloc)
{
  const prbmask_t* used_rb = &tti_alloc->get_ul_mask();
  bzero(alloc, sizeof(ul_harq_proc::ul_alloc_t));
  for (uint32_t n = 0; n < used_rb->size() && alloc->L < L; n++) {
    if (not used_rb->test(n) && alloc->L == 0) {
      alloc->RB_start = n; 
    }
    if (not used_rb->test(n)) {
      alloc->L++; 
    } else if (alloc->L > 0) {
      // avoid edges 
      if (n < 3) {
        alloc->RB_start = 0;
        alloc->L        = 0;
      } else {
        break;
      }
    }
  }
  if (alloc->L==0) {
    return false;
  }
  
  // Make sure L is allowed by SC-FDMA modulation 
  while (!srslte_dft_precoding_valid_prb(alloc->L)) {
    alloc->L--;
  }
  return alloc->L == L; 
}

ul_harq_proc* ul_metric_slicing::allocate_user_retx_prbs(sched_ue *user)
{
  if (tti_alloc->is_ul_alloc(user)) {
    return NULL;
  }
  alloc_outcome_t ret;
  ul_harq_proc*   h = user->get_ul_harq(current_tti);

  // if there are procedures and we have space
  if (h->has_pending_retx()) {
    ul_harq_proc::ul_alloc_t alloc = h->get_alloc();

    // If can schedule the same mask, do it
    ret = tti_alloc->alloc_ul_user(user, alloc);
    if (ret == alloc_outcome_t::SUCCESS) {
      return h;
    } else if (ret == alloc_outcome_t::DCI_COLLISION) {
      log_h->warning("SCHED: Couldn't find space in PDCCH for UL tx of rnti=0x%x\n", user->get_rnti());
      return NULL;
    }

    if (find_allocation(alloc.L, &alloc)) {
      ret = tti_alloc->alloc_ul_user(user, alloc);
      if (ret == alloc_outcome_t::SUCCESS) {
        return h;
      } else if (ret == alloc_outcome_t::DCI_COLLISION) {
        log_h->warning("SCHED: Couldn't find space in PDCCH for UL tx of rnti=0x%x\n", user->get_rnti());
      }
    }
  }
  return NULL;
}

ul_harq_proc* ul_metric_slicing::allocate_user_newtx_prbs(sched_ue* user)
{
  if (tti_alloc->is_ul_alloc(user)) {
    return NULL;
  }
  uint32_t      pending_data = user->get_pending_ul_new_data(current_tti);
  ul_harq_proc* h            = user->get_ul_harq(current_tti);

  // find an empty PID
  if (h->is_empty(0) and pending_data) {
    uint32_t pending_rb = user->get_required_prb_ul(pending_data);
    ul_harq_proc::ul_alloc_t alloc;

    find_allocation(pending_rb, &alloc);
    if (alloc.L > 0) { // at least one PRB was scheduled
      alloc_outcome_t ret = tti_alloc->alloc_ul_user(user, alloc);
      if (ret == alloc_outcome_t::SUCCESS) {
        return h;
      } else if (ret == alloc_outcome_t::DCI_COLLISION) {
        log_h->warning("SCHED: Couldn't find space in PDCCH for UL tx of rnti=0x%x\n", user->get_rnti());
      }
    }
  }
  return NULL;
}

/*********************
 * Slices management
 *********************/

    bool set_slice(int slice_id, rbgmask_t mask){
        if (mask != NULL){
            this.slices[slice_id] = mask;
            return true;
        }
        else{
            return false;
        }
    }

    bool assign_slice_to_user(int slice_id, uint16 rnti){
        this.assigned_slice[rnti] = slice_id;
    }
}
