#!/bin/sh
nginx 
gunicorn -w 4 sensor.wsgi
