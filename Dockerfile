FROM    python:3.11-alpine
RUN     mkdir   app             &&\
        mkdir   startup_script 
COPY    src                     /app
COPY    nginx/default.conf      /etc/nginx/http.d/default.conf
COPY    docker_cmd_script.sh    /startup_script
RUN     apk update
RUN     apk add                 nginx=1.24.0-r6                   &&\
        pip install             gunicorn==20.1.0  Django==4.2.2   &&\
RUN     chmod +x                /startup_script/docker_cmd_script.sh
WORKDIR /app
EXPOSE  80
CMD     ["/startup_script/docker_cmd_script.sh"]
