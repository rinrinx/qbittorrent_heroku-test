FROM ubuntu


COPY root /
COPY upload /upload/
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

# Copy hello-cron file to the cron.d directory
COPY hello-cron /etc/cron.d/hello-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Apply cron job
RUN crontab /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN sudo chmod 777 /start.sh
CMD bash start.sh