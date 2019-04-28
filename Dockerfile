FROM ubuntu:18.04

MAINTAINER Fabian Brash

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx && apt-get clean \
&& echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /newroot
WORKDIR /newroot
COPY carta-master/ /newroot
ADD default /etc/nginx/sites-available/default

EXPOSE 80
CMD ["nginx"]

