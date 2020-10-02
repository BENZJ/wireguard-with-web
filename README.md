# Docker Wireguard
想要创建一个wireguard一键部署脚本

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
docker run -it -P --cap-add=NET_ADMIN --cap-add=SYS_MODULE mywireguard
```

# 版本