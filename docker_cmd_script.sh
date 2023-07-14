#!/bin/sh
rm -r myproject
nginx 
gunicorn sensor.wsgip
