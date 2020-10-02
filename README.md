# Docker Wireguard
想要创建一个wireguard一键部署脚本
# 运行说明
进过尝试发现wirguard需要调用到系统内核模块，安装的时候必须修改使用到/lib/modules文件。参考[cmulk/wireguard-docker](https://github.com/cmulk/wireguard-docker)首次运行的时候执行脚本，来对内核模块进行修改
# 文件说明
```bash
.
├── Dockerfile            #DOCKERFILE文件
├── README.md             #项目说明
├── install_docker.sh     #用于ubuntu一键安装docker如果docker未安装
└── wg0.conf              #wireguard服务器配置文件

```
# 运行
```bash
# build
docker build -t mywireguard .
docker run -it -P --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    -e PUID=1000 \
                    -e PGID=1000 \
                    --name=wireguard \
                    # -v  /usr/src:/usr/src \
                    -v /lib/modules:/lib/modules \
                    mywireguard /bin/bash
```

# 版本