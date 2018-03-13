FROM alpine:latest

MAINTAINER Aleksandr <mikhalev@rp.team>

RUN apk add --update less curl sngrep ngrep asterisk asterisk-curl asterisk-sounds-en asterisk-srtp \ 
tcpdump vim \
# asterisk-sample-config \
	&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /usr/share/man/* /usr/share/groff/* /usr/share/info/* /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*

ADD entrypoint.sh /entrypoint.sh
# attached with compose or docker -v
# ADD config/* /etc/asterisk/

# start asterisk so it creates missing folders and initializes astdb
RUN asterisk && sleep 5

# Expose ports
# EXPOSE 5060/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-U", "root", "-p"]
