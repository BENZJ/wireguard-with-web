docker run          --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    --name=wireguardinit \
                    -v  /usr/src:/usr/src \
                    -v /lib/modules:/lib/modules \
                    mywireguard /bin/bash
docker rm wireguardinit