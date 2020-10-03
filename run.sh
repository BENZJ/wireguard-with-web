
## init
docker run          --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    --name=wireguardinit \
                    -v  /usr/src:/usr/src \
                    -v /lib/modules:/lib/modules \
                    mywireguard /bin/bash
docker rm wireguardinit


## 创建
docker run -it -d --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    --name=wireguard \
                    -p 23333:51820/udp \
                    -v /lib/modules:/lib/modules \
                    -v $PWD/config:/etc/wireguard \
                    mywireguard     

## 关闭wg
wg-quick down wg0

## 开启
wg-quick up wg0