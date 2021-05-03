#!/bin/bash


# 检查config配置文件，并创建
if [ ! -e "/config/qBittorrent/config/qBittorrent.conf" ] ;  then 
mkdir -p /config/qBittorrent/config/
cp /usr/local/qbittorrent/defaults/qBittorrent.conf  /config/qBittorrent/config/qBittorrent.conf
fi

# permissions
chown 0777 -R /config \
    /downloads


chmod 0777 /upload/ -R

nohup yes "" | qbittorrent-nox --webui-port=$PORT  --profile=/config  &
python3 /upload/config.py
python3 /upload/dingshi.py
python3 /upload/check.py
python3 /upload/first.py
python3 /upload/link.py
python3 /upload/mover.py
python3 /upload/qb.py
python3 /upload/rclone.py
