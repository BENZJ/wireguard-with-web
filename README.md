# Docker Wireguard
想要创建一个wireguard一键部署脚本
# 运行
```bash
# build
docker build -t mywireguard .
docker run -it -P --cap-add=NET_ADMIN --cap-add=SYS_MODULE mywireguard
```