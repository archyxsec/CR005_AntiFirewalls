FROM debian

RUN apt-get update && \
    apt-get install -y \
	iptables \
	iproute2 \
	net-tools \
	tcpdump \
	iputils-ping \
	nano \
    less \
	openssh-server \
	rsyslog \
	curl \
	sudo \
	&& \
    apt-get clean

COPY assets/sshd_config /etc/ssh/sshd_config

RUN chmod 644 /etc/ssh/sshd_config && \
    chown root:root /etc/ssh/sshd_config && \
    useradd -ms /bin/bash dev

COPY assets/hosts /etc/hosts
RUN chown dev:dev -R /home/dev
