docker run -it -d --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    --name=wireguard \
                    -p 23333:51820/udp \
                    -p 9999:9000/tcp \
                    -v /lib/modules:/lib/modules \
                    -v $PWD/config:/etc/wireguard \
                    benzj/mywireguard  



docker run -it      --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    --sysctl "net.ipv6.conf.all.disable_ipv6=0 \
        net.ipv4.conf.all.forwarding=1 net.ipv6.conf.all.forwarding=1"  \
                    --name=wireguard \
                    -p 23333:51820/udp \
                    -v /lib/modules:/lib/modules \
                    -v $PWD/config:/etc/wireguard \
                    benzj/wireguard_with_webcontrol bash

docker start wireguard
docker exec -it wireguard bash 
docker stop wireguard
docker rm wireguard

docker run --cap-add net_admin --cap-add sys_module -v $PWD/config:/etc/wireguard -p 23333:51820/udp cmulk/wireguard-docker:buster                        