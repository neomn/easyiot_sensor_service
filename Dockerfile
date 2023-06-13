FROM fedora:rawhide
RUN dnf update -y
RUN dnf install -y nginx-1.24.0  python3   python3-pip
RUN pip install fastapi
RUN pip install "uvicorn[standard]"
RUN mkdir /app
RUN mkdir /startup_script
COPY /src /app
COPY nginx/nginx.conf  /etc/nginx/nginx.conf
COPY ./docker_cmd_script.sh   /startup_script
RUN chmod +x /startup_script/docker_cmd_script.sh
WORKDIR /app
CMD ["/startup_script/docker_cmd_script.sh"]
EXPOSE 7000
