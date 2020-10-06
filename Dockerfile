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
COPY entrypoint.sh /script/entrypoint.sh
COPY install-module /script/install-module
ENV PATH=${PATH}:/script
RUN \
chmod +x /script/entrypoint.sh && \
chmod +x /script/install-module && \
echo "**** install revel ****" && \
go get github.com/revel/revel && \
go get github.com/revel/cmd/revel && \
echo "**** install webconfig ****" && \
git clone https://github.com/BENZJ/Web_Wireguard_config
# revel package Web_Wireguard_config && \
# mkdir wgconfig #&& \
# tar -zxvf ./Web_Wireguard_config/Web_Wireguard_config.tar.gz  -C ./wgconfig


EXPOSE 51820/udp
EXPOSE 9000/tcp
# ENTRYPOINT ["entrypoint.sh"]