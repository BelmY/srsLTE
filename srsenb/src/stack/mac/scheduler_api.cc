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
#include "srsenb/hdr/json/json.hpp"

#define BUFFER_SIZE 8096

srsenb::scheduler_api::scheduler_api(){
    this->running = false;
}

srsenb::scheduler_api::~scheduler_api() {
    this->stop_api_thread();
    this->running = false;
}

void srsenb::scheduler_api::init(sched* scheduler)
{
    this->scheduler = scheduler;
    this->run_api_thread();
}

void srsenb::scheduler_api::stop()
{
    this->stop_api_thread();
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

void srsenb::scheduler_api::process_http_request(int *socket_fd){

    int local_socket_fd;
    struct sockaddr_in client_local;

    char request[BUFFER_SIZE+1];
    char reply[BUFFER_SIZE+1];
    long bytes_read;
    int f_size = 0;

    // Take mutex in order to prevent other threads write in our socket
    if((pthread_mutex_lock(&this->mutex)) == -1){
        printf("[ERROR] Can't take mutex for create a local copy\n");
        return;
    }
    // Create a local copy for the socket
    local_socket_fd = *socket_fd;
    client_local.sin_addr=client_addr.sin_addr;
    this->end_copy = 1;
    // We notify the other threads that have finished copying
    if((pthread_cond_signal(&this->copied)) == -1){
        printf("[ERROR] Problems sengind copied signal.\n");
        return;
    }
    // Free mutex
    if((pthread_mutex_unlock(&this->mutex)) == -1){
        printf("[ERROR] During mutex free.\n");
        return;
    }
    bytes_read = read(local_socket_fd, request, BUFFER_SIZE);

    // if we read 0, there is a connection closed or we are at end of file
    if (bytes_read == 0){
        printf("[ERROR] Read 0 bytes. Connection closed or EOF detected.\n");
        exit(1);
    }
    // if read return -1, there are problems opening the socket
    else if (bytes_read == -1){
        printf("[ERROR] Problems opening socket for reading \n");
        exit(1);
    }
    // If we read correct data, we put "0" at the end of the buffer.
    else if ((bytes_read > 0) && (bytes_read < BUFFER_SIZE)){
        request[bytes_read]=0;
    }
    else request[0]=0;

    //printf("scheduler_api > Received: %s \n",request);
    //printf("\n");
    
    // Parse received HTTP request
    char* request_line = strtok(request, "\n");
    char* host = strtok(NULL, "\n");
    char* user_agent = strtok(NULL, "\n");
    char* accept = strtok(NULL, "\n");
    char* content_type = strtok(NULL, "\n");
    char* content_length = strtok(NULL, "\n");
    strtok(NULL, "\n");
    char* data = strtok(NULL, "\n");

    char* operation = strtok(request_line, " ");
    char* file_path = strtok(NULL, " ");

    if (strcmp(operation, "GET") == 0){
        printf("scheduler_api> HTTP GET %s\n", file_path);
        printf("\n");
        sprintf(reply, "HTTP/1.1 200 OK\r\nContent-length: %i\r\nContent-Type: %s\r\n\r\n",f_size, file_path);
        write(local_socket_fd, reply, strlen(reply));
    }
    else if (strcmp(operation, "POST") == 0){
        if ((strcmp(content_type, "Content-Type: application/json\r") == 0) && (strcmp(file_path, "/slice") == 0)){
            printf("scheduler_api> HTTP POST\n");
            printf("\n");

            nlohmann::json json_data = nlohmann::json::parse(data);
            rbgmask_t new_mask;
            std::string mask = json_data["mask"].get<std::string>();
            for (int i = 0; i < mask.length(); i++){
                if (!std::atoi(reinterpret_cast<const char *>(mask.at(i)))){
                    new_mask.set(i);
                }
            }
            
            scheduler->get_dl_metric()->set_slice(std::stoi(json_data["slice_id"].get<std::string>().c_str()), new_mask);
            //TODO: Enable list of rntis in the received json
	    uint16 user_rnti = std::stoi(json_data["user"].get<std::string>().c_str());
            scheduler->get_dl_metric()->assign_slice_to_user(std::stoi(json_data["slice_id"].get<std::string>().c_str()), user_rnti);

	    printf("[INFO] User 0x%x assigned to slice %i (Mask %s)\n", user_rnti, json_data["slice_id"].get<std::string>().c_str(), mask);
	    printf("\n");

            sprintf(reply, "HTTP/1.1 200 OK\r\nContent-length: %i\r\nContent-Type: %s\r\n\r\n",f_size, content_type);
            write(local_socket_fd, reply, strlen(reply));
        }
        else{
                printf("scheduler_api> Content-Type %s  or path not allowed by the server. application/json and /slice are allowed.\n", content_type);
                sprintf(reply, "HTTP/1.0 405 Method Not Allowed\r\nContent-Length: %i\r\nContent-Type: %s\r\n\r\n", f_size, file_path);
                write(local_socket_fd, reply, strlen(reply));
        }
    }
    else{
        printf("scheduler_api> Operation %s not supported by the server. Just GET/POST requests are supported\n", operation);
        sprintf(reply, "HTTP/1.0 405 Method Not Allowed\r\nContent-Length: %i\r\nContent-Type: %s\r\n\r\n", f_size, file_path);
        write(local_socket_fd, reply, strlen(reply));
    }

    sleep(1);
    /* Cerramos el socket */
    close(local_socket_fd);
    printf("scheduler_api> Conection Finished\n");
    /* Matamos al hilo */
    pthread_exit(0);

}

int srsenb::scheduler_api::work_imp(){
    int port, sd, new_socket;
    int pid;
    struct sockaddr_in server_addr;

    port = atoi(this->PORT);

    pid = fork();
    // Main process
    if (pid != 0){
        return 0;
    }
    // Child process
    else{
        // Ignoring all the signals, child never ends
        //signal(SIGINT, SIG_IGN);
        //signal(SIGCHLD, SIG_IGN);
        //signal(SIGHUP, SIG_IGN);

        /* Initialize mutex and conditional varialbes */
        pthread_mutex_init(&mutex, NULL);
        pthread_cond_init(&copied, NULL);

        /* Size of client address definition*/
        socklen_t size_client = sizeof(this->client_addr);

        /* Socket creation */
        if ((sd = socket(AF_INET, SOCK_STREAM, 0)) == -1){
            printf("[ERROR] Can't create the socket\n");
            return -1;
        }

        /* socket parameters */
        bzero((char *)&server_addr, sizeof(server_addr));		// fill it with zero
        server_addr.sin_family = AF_INET;						// Domain (Internet)
        server_addr.sin_addr.s_addr = INADDR_ANY;				// All addresses
        server_addr.sin_port=htons(port);						// Given port

        /* Socket binding */
        if((bind(sd, (struct sockaddr *) &server_addr, sizeof(server_addr))) == -1){
            printf("[ERROR] Can't bind socket to server address\n");
            return -1;
        }

        /* Get server ip */
        struct sockaddr_in local;
        char server_name[255];
        gethostname(server_name, 255);											// Take the system name
        local.sin_addr = *(struct in_addr*) gethostbyname(server_name)->h_addr; // Take the first host address
        char *ip = inet_ntoa(local.sin_addr);									// Translate the ip to the correct format

        printf("scheduler_api > init <%s>:<%d>\n", ip, ntohs(server_addr.sin_port));

        /* Start listening and set maximun queue of pending connections to 64*/
        if((listen(sd, 64)) == -1){
            printf("[ERROR] Can't start listening\n");
            return -1;
        }

        while(this->running){

            printf("scheduler_api> waiting for requests ...\n");

            /* Accepts connections */
            if((new_socket = accept(sd, (struct sockaddr *)&client_addr,&size_client)) == -1){
                printf("[ERROR] Can't accept client conection\n");
                return -1;
            }

            /* Get client ip */
            struct sockaddr_in local_client;
            char client_name[255];
            gethostname(client_name, 255);
            local_client.sin_addr =*(struct in_addr*) gethostbyname(client_name)->h_addr;
            char *client_ip = inet_ntoa(local_client.sin_addr);

            printf("scheduler_api> accept <%s>:<%d>\n", client_ip, ntohs(client_addr.sin_port));

            /* Create a thead that will be in charge of  manage the request. We pass the following parameters:
                - attributes --> thread parameters
                - process_http_request --> Function to be executed by the thread
                - new_socket --> the socket with the new  connection
            */
            std::thread http_handler_thread(&srsenb::scheduler_api::process_http_request, this, &new_socket);
            http_handler_thread.detach();

            pthread_mutex_lock(&this->mutex);
            /* wait until thread has finished copying the arguments */
            while(!this->end_copy) {
                pthread_cond_wait(&this->copied, &this->mutex);
            }
            this->end_copy=0;

            pthread_mutex_unlock(&this->mutex);
        }
        close (sd);
        printf("scheduler_api> Closing server\n");
        exit(0);
    }
}

void srsenb::scheduler_api::run_api_thread(){
    this->running = true;
    std::thread api_thread(&srsenb::scheduler_api::work_imp, this);
    api_thread.detach();
}
void srsenb::scheduler_api::stop_api_thread(){
    this->running = false;
}
