FROM ubuntu


COPY root /
RUN apt-get update
RUN apt-get install sudo
RUN sudo apt-get update
RUN apt-get install wget -y

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN sudo apt-get install python3-distutils -y
RUN python3 get-pip.py
RUN pip3 install pyTelegramBotAPI
RUN pip3 install qbittorrent-api


RUN sudo chmod 777 /qbittorrent-nox
RUN mv /qbittorrent-nox /usr/bin/

RUN apt-get -y install rsyslog
ADD files/crontab /app/crontab
RUN crontab /app/crontab
RUN touch /var/log/cron.log

RUN sudo chmod 777 /start.sh
CMD bash start.sh