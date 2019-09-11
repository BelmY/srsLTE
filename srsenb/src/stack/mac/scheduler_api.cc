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

srsenb::scheduler_api::scheduler_api(){
    this->running = false;
}

void srsenb::scheduler_api::init(sched* scheduler)
{
    this->scheduler = scheduler;
    this->run_api_thread();
}

bool srsenb::scheduler_api::set_dl_slice_mask(int slice_id, rbgmask_t mask){
    return this->scheduler->get_dl_metric()->set_slice(slice_id, mask);
}

//TODO: not yet implemented
bool srsenb::scheduler_api::set_ul_slice_mask(int slice_id, prbmask_t mask){
    return false;
}

bool srsenb::scheduler_api::assign_slice_to_user(int slice_id, uint16_t rnti) {
    return this->scheduler->get_dl_metric()->assign_slice_to_user(slice_id, rnti);
}

void srsenb::scheduler_api::work_imp(){

    int server_fd, new_socket; long valread;
    struct sockaddr_in address;
    int addrlen = sizeof(address);
    int PORT = 8787;

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
        printf("\n+++++++ leemos ++++++++\n\n");
        char buffer[30000] = {0};
        valread = read( new_socket , buffer, 30000);
	printf("\n+++++++ tenemos algo ++++++++\n\n");
        printf("%s\n",buffer );
        write(new_socket , hello , strlen(hello));
        printf("------------------Hello message sent-------------------\n");
        close(new_socket);
    }
    return;

}

void srsenb::scheduler_api::run_api_thread(){
    this->running = true;
    std::thread api_thread(&srsenb::scheduler_api::work_imp, this);
    api_thread.detach();
}
void srsenb::scheduler_api::stop_api_thread(){
    this->running = false;
}
