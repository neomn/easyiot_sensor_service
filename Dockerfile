FROM    neomn110/django:alpine
RUN     rm -r                   /app/myproject  /app/manage.py  /startup_script/dcoker_cmd_script.sh
COPY    src                     /app
COPY    docker_cmd_script.sh    /startup_script/docker_cmd_script.sh
RUN     apk update &&\  
        chmod +x                /startup_script/docker_cmd_script.sh
WORKDIR /app
EXPOSE  80
CMD     ["/startup_script/docker_cmd_script.sh"]
