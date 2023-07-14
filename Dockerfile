FROM    neomn110/django:alpine
COPY    src                     /app
COPY    docker_cmd_script.sh    /startup_script
RUN     apk update                                                   &&\  
        chmod +x                /startup_script/docker_cmd_script.sh
WORKDIR /app
EXPOSE  80
CMD     ["/startup_script/docker_cmd_script.sh"]
