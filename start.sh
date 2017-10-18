#!/usr/bin/env bash

#Parse the port and host from config/local.json
PORT=`grep -Po '"port":"\K\d*' /home/pi/apps/sshtunnel/config/local.json`
HOST=`grep -Po '"host":"\K[\w\.-]*' /home/pi/apps/sshtunnel/config/local.json`
USER=`grep -Po '"user":"\K[\w\.-]*' /home/pi/apps/sshtunnel/config/local.json`

echo Opening SSH reverse tunnel to $USER@$HOST:$PORT

ssh -N -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -R $PORT:localhost:22 $USER@$HOST
