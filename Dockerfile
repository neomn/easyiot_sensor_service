FROM python:3.11-alpine
RUN apk   update
RUN apk   add        uwsgi=2.0.21-r3
RUN pip   install    Django==4.2.2 
