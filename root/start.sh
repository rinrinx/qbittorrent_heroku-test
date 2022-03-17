#!/bin/bash

mkdir /config
chmod 0777 /config
# 检查config配置文件，并创建
if [ ! -e "/config/qBittorrent/config/qBittorrent.conf" ] ;  then 
mkdir -p /config/qBittorrent/config/
cp /usr/local/qbittorrent/defaults/qBittorrent.conf  /config/qBittorrent/config/qBittorrent.conf
fi

# permissions
mkdir /root/downloads
chmod 0777 /root/downloads
cd /root
git clone https://github.com/winkxx/qbittorrent_heroku
#rm -rf /qbittorrent_heroku


nohup yes "" | /root/qb/qbittorrent-nox --webui-port=$PORT  --profile=/root/upload  &
python3 /upload/config.py
python3 /upload/dingshi.py
