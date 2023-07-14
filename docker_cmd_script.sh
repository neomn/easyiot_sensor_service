#!/bin/sh
rm -r my
nginx 
gunicorn -w 4 sensor.wsgip
