#!/bin/bash

# ** ip tables rules **
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -p tcp --dport 80 -s 10.0.1.4 -j ACCEPT
iptables -A INPUT -p tcp --sport 80 -s 10.0.2.3 -j ACCEPT

iptables -A INPUT -p tcp --dport 22 -s 10.0.3.3 -j ACCEPT

iptables -A INPUT -p udp -j ACCEPT
iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

ip route del default
ip route add default via 10.0.2.2 dev eth0
# *********************

service ssh start
cp hosts /etc/hosts
cd /flask_restful_api/ && /usr/bin/python3 main.py

if [ -z "$@" ]; then
    exec /bin/bash
else
    exec $@
fi
