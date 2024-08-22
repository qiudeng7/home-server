# home-server

家庭服务器，只适用于Linux amd64.

结构如下

```txt
home-server
├── frpc-ssh 内网穿透，只穿透ssh端口。
├── dockege 一个docker-compose可视化界面
│   ├── homarr home-server的主要入口
│   └── frpc-apps 内网穿透，穿透其他应用的端口
└── wol 远程唤醒，唤醒局域网内的其他机器。

```

所有应用只有wol不在docker中运行，因此其他几个里面也只有compose和应用本身的配置文件。

## wol

wol 用了这个仓库 [GramThanos/WakeOnLAN](https://github.com/GramThanos/WakeOnLAN)

使用方法是在任意工作目录执行wol目录下的shell脚本即可唤醒，脚本内容如下。

```shell
# 待唤醒机器的mac地址
# 待唤醒机器需要和本机在同一局域网内

mac=b4:2e:99:d5:57:ab

# 执行脚本同级目录下的WakeOnLan 向该mac地址发送magic package
# 更多wol相关内容请查看 https://github.com/GramThanos/WakeOnLAN
parent_dir=$(dirname $(realpath  $0))
$parent_dir/WakeOnLAN $mac
```



## frpc-ssh / frpc-apps

frp是一个内网穿透工具，更多信息请查看[这个仓库](https://github.com/fatedier/frp)

专门把ssh的端口和其他应用的端口分开，并且ssh的frpc不受dockge管理，因为它不宜经常变动。

这两个frpc的toml要自己写上才能正常运行。

## dockge

[dockge](https://github.com/louislam/dockge)是一个docker-compose的可视化管理界面，它提倡尽量把所有内容写在compose里，并通过管理compose的方法来管理容器。除了frpc-ssh以外的所有容器都会通过它来管理。

## homarr

[homarr](http://github.com/ajnart/homarr)可以定位为一个 起始页/桌面/工作台/dashboard/startpage/homepage，可以快速进入自己部署的应用各自的dashboard，记录一些todo，或者用来整理工具集。
