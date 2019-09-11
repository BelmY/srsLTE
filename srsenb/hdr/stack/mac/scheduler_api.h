// Created by Gines Garcia Aviles.
//  - @mail: gines.garcia2[at]gmail.com
//  - @github: https://github.com/GinesGarcia

#ifndef SRSLTE_SCHEDULER_API_H
#define SRSLTE_SCHEDULER_API_H

#include <thread>
#include "scheduler_harq.h"
#include "scheduler.h"
#include <sys/socket.h>

namespace srsenb{

    class scheduler_api {

        bool        running;
        sched*      scheduler = NULL;

        int port;
        size_t buffer_size;

        static void clientHandler(int client_socket, size_t buffer_size);

        public:
            scheduler_api();
            ~scheduler_api();
            /**
            * Initialize a new scheduler_api instance (server).
            * @param scheduler: scheduler instance managed by means of the api
            */
            void init(sched* scheduler);

            bool set_dl_slice_mask(int slice_id, rbgmask_t mask);
            bool set_ul_slice_mask(int slice_id, prbmask_t mask);
            bool assign_slice_to_user(int slice_id, uint16_t rnti);

        private:
            int work_imp();
            /**
            * Starts api thread
            */
            void run_api_thread();
            /**
            * Stops api thread
            */
            void stop_api_thread();
    };

}

#endif //SRSLTE_SCHEDULER_API_H
