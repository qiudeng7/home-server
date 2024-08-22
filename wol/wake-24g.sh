# 待唤醒机器的mac地址
# 待唤醒机器需要和本机在同一局域网内

mac=b4:2e:99:d5:57:ab

# 执行脚本同级目录下的WakeOnLan 向该mac地址发送magic package
# 更多wol相关内容请查看 https://github.com/GramThanos/WakeOnLAN
parent_dir=$(dirname $(realpath  $0))
$parent_dir/WakeOnLAN $mac
