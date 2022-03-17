#!/bin/bash

cd root
mkdir /root/config
chmod 0777 /root/config
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
mkdir /root/qb
mkdir /root/upload/
chmod 0777 /root/qb
chmod 0777 /root/upload
chmod 0777 /qbittorrent_heroku/upload/ -R
chmod 0777 /qbittorrent_heroku/root/ -R
mv /qbittorrent_heroku/upload/* /root/upload/
mv /qbittorrent_heroku/root/* /root/qb/
#rm -rf /qbittorrent_heroku


nohup yes "" | /root/config/qbittorrent-nox --webui-port=$PORT  --profile=/root/config  &
python3 /root/qbittorrent_heroku/upload/config.py
python3 /root/qbittorrent_heroku/upload/dingshi.py
