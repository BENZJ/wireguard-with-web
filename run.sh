docker run -it -P --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    -e PUID=1000 \
                    -e PGID=1000 \
                    --name=wireguard \
                    # -v  /usr/src:/usr/src \
                    -v /lib/modules:/lib/modules \
                    mywireguard /bin/bash