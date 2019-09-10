// Created by Gines Garcia Aviles.
//  - @mail: gines.garcia2[at]gmail.com
//  - @github: https://github.com/GinesGarcia

#ifndef SRSLTE_SCHEDULER_API_H
#define SRSLTE_SCHEDULER_API_H

#include "scheduler.h"

namespace srsenb{

    class scheduler_api {

        sched* scheduler;
        std::thread api_thread;
        bool running;

        public:
            scheduler_api(const char* ip_addr, int port);
            bool init(sched* scheduler);
            void run_api_thread();
            void stop_api_thread();
            bool set_dl_slice_mask(int slice_id, rbgmask_t mask);
            bool set_ul_slice_mask(int slice_id, prbmask_t mask);
            bool assign_slice_to_user(int slice_id, uint16_t rnti);

        private:
            void work_imp();
            void run_thread();
    };

}

#endif //SRSLTE_SCHEDULER_API_H
