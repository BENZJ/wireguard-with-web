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
sysctl -p &&\
echo "**** install golang ****" && \
wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz &&\
tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz &&\
mkdir /root/go && \
export GOPATH=/root/go && \
export PATH=$PATH:/usr/local/go/bin && \
export PATH=$PATH:$GOPATH/bi && \
echo "**** install revel ****" && \
go get github.com/revel/revel && \
go get github.com/revel/cmd/revel && \
echo "**** install webconfig ****" && \
git clone https://github.com/BENZJ/Web_Wireguard_config && \
revel package Web_Wireguard_config && \
mkdir wgconfig && \
tar -zxvf ./Web_Wireguard_config/Web_Wireguard_config.tar.gz  -C ./wgconfig && \
nohup wgconfig/run.sh > wgweboutput 2>&1 & 


# COPY wg0.conf /etc/wireguard/wg0.conf
COPY install-module install-module
COPY entrypoint.sh entrypoint.sh

# RUN \
# echo "**** start wireguard ****" 
# # && \
# # wg-quick up wg0
EXPOSE 51820/udp
EXPOSE 9000/tcp
ENTRYPOINT [ "/bin/bash","entrypoint.sh"]
