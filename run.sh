docker run -it -d --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    --name=wireguard \
                    -p 23333:51820/udp \
                    -p 9999:9000/tcp \
                    -v /lib/modules:/lib/modules \
                    -v $PWD/config:/etc/wireguard \
                    benzj/mywireguard                          