// Created by Gines Garcia Aviles.
//  - @mail: gines.garcia2[at]gmail.com
//  - @github: https://github.com/GinesGarcia

#ifndef SRSLTE_SCHEDULER_API_H
#define SRSLTE_SCHEDULER_API_H

#include "scheduler_harq.h"
#include "scheduler.h"
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <netdb.h>			// Allow us to use gethostbyname
#include <arpa/inet.h>		// Allow us to use inet_ntoa
#include <unistd.h>
#include <signal.h>
#include <fcntl.h>

namespace srsenb{

    class scheduler_api {

        bool        running;
        sched*      scheduler = NULL;

        const char* PORT = "8787";
        struct request{
            int operation;
        };
        // Client address
        struct sockaddr_in client_addr;
        std::map<char*,int> http_op_id;

        // Concurrency control variables
        pthread_mutex_t mutex;
        pthread_cond_t copied;
        int end_copy = 0;

        public:
            scheduler_api();
            ~scheduler_api();

            void init(sched* scheduler);
            void stop();

            bool set_dl_slice_mask(int slice_id, rbgmask_t mask);
            bool set_ul_slice_mask(int slice_id, prbmask_t mask);
            bool assign_slice_to_user(int slice_id, uint16_t rnti);

            /**
             * Processes all the requests made to the server
             * @param socket_fd: Opened socket to the client
             * @return
             */
            void process_http_request(int *socket_fd);

        private:
            /**
             * Runs the main HTTP server thread
             * @return
             */
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
