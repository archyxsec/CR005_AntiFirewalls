#!/bin/bash

# ** ip tables rules **
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -p tcp --dport 80 -s 10.0.1.2 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.0.2.4 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.0.2.3 -j ACCEPT

# aceptamos conexiones ssh del router
iptables -A INPUT -p tcp --dport 22 -s 10.0.1.2 -j ACCEPT

iptables -A INPUT -p udp -j ACCEPT
iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

ip route del default
ip route add default via 10.0.1.2 dev eth0
# *********************

service ssh start
cp hosts /etc/hosts
update-ca-certificates
cd /flask_restful_api/ && /usr/bin/python3 main.py

#npm init

#npm install express
#npm install body-parser
#npm install request
#npm install https
#npm install ejs
#npm install nodemon

#nodemon web/app.js

if [ -z "$@" ]; then
    exec /bin/bash
else
    exec $@
fi
