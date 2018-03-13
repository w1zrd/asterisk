#!/bin/sh
docker run --rm --name sip -v config:/etc/asterisk/ -p 8088:8088/tcp -p 5060:5060/tcp -p "17000-17100":"17000-17100/udp" asterisk
