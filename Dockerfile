# Use an official Ubuntu runtime as a parent image
FROM --platform=linux/arm/v7 ubuntu:20.04

#ENV SYNC_USERNAME
#ENV SYNC_PASSWORD

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y curl cifs-utils inetutils-ping rsync && \
    rm -rf /var/lib/apt/lists/*


COPY rsync-backup.sh /usr/local/bin/simmons-backup

RUN chmod +x /usr/local/bin/simmons-backup

CMD ["simmons-backup"]
