echo 1 > /proc/sys/net/ipv4/ip_forward

#service ssh start

#cp hosts /etc/hosts

if [ -z "$@" ]; then
    exec /bin/bash
else
    exec $@
fi

