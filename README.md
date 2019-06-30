# ztj1993/rttys

- 最后发布版本：2.10.2
- [Docker Hub](https://hub.docker.com/r/ztj1993/rttys)

## 简要说明

这个镜像主要构建了 [zhaojh329/rttys](https://github.com/zhaojh329/rttys) 服务。

发布版本号会跟随服务版本号。

## 快速开始

运行 rttys 镜像：
```
docker run -d --name rttys ztj1993/rttys:2.10.2
```

映射端口：
```
docker run  -d --name rttys -p 5912:5912 ztj1993/rttys:2.10.2
```

docker compose：
```
version: '2'
services:
  rttys:
    image: ztj1993/rttys:2.10.2
    ports:
      - 5912:5912
    volumes:
      - /rttys/rttys.crt:/rttys/rttys.crt
      - /rttys/rttys.key:/rttys/rttys.key
      - /etc/localtime:/etc/localtime:ro
```

以上应该输出：
```
INFO[0000] Go Version: go1.12.4
INFO[0000] Go OS/Arch: linux/amd64
INFO[0000] Rttys Version: 2.10.2
INFO[0000] Git Commit: c5ee722
INFO[0000] Build Time: 2019-04-30T10:30:37+0800 
INFO[0000] Listen on: :5912 SSL on
```

如果存在错误，请通过 [Issue](https://github.com/ztj1993/docker-rttys/issues) 反馈。

## 环境变量

环境变量主要是对 rttys 的配置。

- RTTYS_USERNAME: 用户名称，默认 admin
- RTTYS_PASSWORD: 用户密码，默认 admin
- RTTYS_TOKEN: 用户令牌，默认自动随机生成