FROM alpine:latest

MAINTAINER github.com/shourai
LABEL Description="vsftpd Docker image based on Alpine Linux. Supports passive mode."

RUN apk --no-cache add vsftpd

ENV FTP_USER=username
ENV FTP_PASS=password
ENV PASV_ENABLE=YES
ENV PASV_MIN_PORT=21100
ENV PASV_MAX_PORT=21110
ENV PASV_ADDRESS=127.0.0.1

COPY vsftpd.sh /usr/sbin/

RUN chmod +x /usr/sbin/vsftpd.sh

EXPOSE 20 21

ENTRYPOINT ["/usr/sbin/vsftpd.sh"]