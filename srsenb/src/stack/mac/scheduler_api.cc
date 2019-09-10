// Created by Gines Garcia Aviles.
//  - @mail: gines.garcia2[at]gmail.com
//  - @github: https://github.com/GinesGarcia

#include "srsenb/hdr/stack/mac/scheduler_api.h"
#include <stdio.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <string.h>
#include <thread>

srsenb::scheduler_api::scheduler_api(){
    this->running = false;
}

bool srsenb::scheduler_api::init(sched* scheduler)
{
    if (scheduler == NULL){
        return false;
    }
    else{
        this->run_api_thread(scheduler);
        return true;
    }
}

bool srsenb::scheduler_api::set_dl_slice_mask(sched* scheduler, int slice_id, rbgmask_t mask){
    return scheduler->get_dl_metric()->set_slice(slice_id, mask);
}

//TODO: not yet implemented
bool srsenb::scheduler_api::set_ul_slice_mask(sched* scheduler, int slice_id, prbmask_t mask){
    return false;
}

bool srsenb::scheduler_api::assign_slice_to_user(sched* scheduler, int slice_id, uint16_t rnti) {
    return scheduler->get_dl_metric()->assign_slice_to_user(slice_id, rnti);
}

void srsenb::scheduler_api::work_imp(sched* scheduler){

    int server_fd, new_socket; long valread;
    struct sockaddr_in address;
    int addrlen = sizeof(address);
    int PORT = 8080;

    char *hello = "Hello from server";

    // Creating socket file descriptor
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0){
        perror("In socket");
        exit(EXIT_FAILURE);
    }

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons( PORT );

    memset(address.sin_zero, '\0', sizeof address.sin_zero);

    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address))<0){
        perror("In bind");
        exit(EXIT_FAILURE);
    }
    if (listen(server_fd, 10) < 0){
        perror("In listen");
        exit(EXIT_FAILURE);
    }
    while(this->running){
        printf("\n+++++++ Waiting for new connection ++++++++\n\n");
        if ((new_socket = accept(server_fd, (struct sockaddr *)&address, (socklen_t*)&addrlen))<0)
        {
            perror("In accept");
            exit(EXIT_FAILURE);
        }

        char buffer[30000] = {0};
        valread = read( new_socket , buffer, 30000);
        printf("%s\n",buffer );
        write(new_socket , hello , strlen(hello));
        printf("------------------Hello message sent-------------------\n");
        close(new_socket);
    }
    return;

}

void srsenb::scheduler_api::run_api_thread(sched* scheduler){
    this->running = true;
    this->api_thread(srsenb::scheduler_api::work_imp(scheduler));
}
void srsenb::scheduler_api::stop_api_thread(){
    this->running = false;
}
