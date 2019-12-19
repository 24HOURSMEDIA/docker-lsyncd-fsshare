FROM alpine:latest
MAINTAINER 24hoursmedia <info@24hoursmedia.com>

# specify an exclude list alias to exclude files for different purposes
# exclude lists are placed in /lsync-exclude/{handle}.txt
# several examples are provided: default
# you can also specify this with an environment variable
ARG exclude_handle=default

RUN apk --no-cache add lsyncd

RUN mkdir -p /mnt/master
RUN chown -R nobody:nobody /mnt/master
RUN mkdir -p /mnt/replica
RUN chown -R nobody:nobody /mnt/replica


COPY lsyncd.conf /lsyncd.conf
COPY lsyncd-exclude /lsyncd-exclude
COPY run-lsyncd.sh /run-lsyncd.sh
RUN chmod +x /run-lsyncd.sh

# symlink an exclude template file
RUN ln -s /lsyncd-exclude/${exclude_handle}.txt /exclude.txt

WORKDIR /mnt/master

# mount these in docker-compose
# VOLUME /mnt/master
# VOLUME /mnt/replica




ENTRYPOINT ["/run-lsyncd.sh"]