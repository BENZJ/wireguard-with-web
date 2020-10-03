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


#$PWD/config: 来挂载本地的wg0.conf文件实行配置
docker run -it -d --cap-add=NET_ADMIN \
                    --cap-add=SYS_MODULE \
                    --name=wireguard \
                    -p 23333:51820/udp \
                    -v /lib/modules:/lib/modules \
                    -v $PWD/config:/etc/wireguard \
                    mywireguard  
```

# 版本
## 1.0.0
- 实现了最基本的wireguard用docker进行安装
# To Do
- 把所有文件都是用统一的shell脚本进行启动
- 添加日志
- 添加重启
- 添加查看操作
