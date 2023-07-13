FROM    python:3.11-alpine
RUN     apk update
RUN     apk add                 nginx=1.24.0-r6  build-base=0.5-r3 
RUN     pip install               Django==4.2.2 
RUN     mkdir                   app
RUN     mkdir                   startup_script
COPY    src                     /app
COPY    nginx/default.conf      /etc/nginx/http.d/default.conf
COPY    docker_cmd_script.sh    /startup_script
RUN     chmod +x                /startup_script/docker_cmd_script.sh
WORKDIR /app
EXPOSE  80
CMD     ["/startup_script/docker_cmd_script.sh"]
