FROM ubuntu:16.04
RUN \
echo "**** install dependencies ****" && \
apt-get update && \
apt install  -y --no-install-recommends \
        git \
        wget \
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
rm go1.15.2.linux-amd64.tar.gz && \
mkdir /root/go
ENV GOPATH=/root/go
ENV PATH=${PATH}:/usr/local/go/bin
ENV PATH=${PATH}:${GOPATH}/bin
RUN \
echo "**** install revel ****" && \
go get github.com/revel/revel && \
go get github.com/revel/cmd/revel && \
echo "**** install webconfig ****" && \
git clone https://github.com/BENZJ/Web_Wireguard_config && \
revel package Web_Wireguard_config && \
mkdir wgconfig && \
tar -zxvf ./Web_Wireguard_config/Web_Wireguard_config.tar.gz  -C ./wgconfig
COPY install-module install-module
COPY entrypoint.sh entrypoint.sh
EXPOSE 51820/udp
EXPOSE 9000/tcp
ENTRYPOINT [ "/bin/bash","entrypoint.sh"]