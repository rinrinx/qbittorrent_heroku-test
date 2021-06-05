#!/bin/bash
sudo /usr/sbin/service cron start
chmod 0777 /upload/ -R
git clone https://github.com/winkxx/rclone
chmod 0777 /rclone/ -R
cp -f rclone/rclone.conf config/rclone
python3 /upload/config.py
python3 /upload/dingshi.py
yes "" | qbittorrent-nox --webui-port=$PORT  --profile=/config
