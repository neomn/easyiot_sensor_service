FROM    neomn110/django:alpine
COPY    src                     /app
COPY    docker_cmd_script.sh    /startup_script
RUN     apk update                                                   &&\  
        apk add                 nginx=1.24.0-r6                      &&\
        pip install             gunicorn==20.1.0  Django==4.2.2      &&\
        chmod +x                /startup_script/docker_cmd_script.sh
WORKDIR /app
EXPOSE  80
CMD     ["/startup_script/docker_cmd_script.sh"]
