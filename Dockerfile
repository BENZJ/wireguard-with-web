# FROM lsiobase/ubuntu:bionic
FROM ubuntu:16.04
RUN \
echo "**** install dependencies ****" && \
apt-get update && \
apt install  -y --no-install-recommends \
        git \
        ca-certificates \
        wireguard \
        iproute2 \
	iptables \
        net-tools  && \
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf  &&\
sysctl -p 

COPY wg0.conf /etc/wireguard/wg0.conf
COPY install-module install-module

RUN \
echo "**** start wireguard ****" 
# && \
# wg-quick up wg0
EXPOSE 51820/udp
ENTRYPOINT [ "wg-quick","up","wg0"]
