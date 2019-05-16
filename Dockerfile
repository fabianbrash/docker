FROM ubuntu:18.04

MAINTAINER Fabian Brash

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl perl psmisc nginx \
&& apt-get clean

RUN mkdir /umds-store67
RUN mkdir /umds-staging
RUN mkdir -p /etc/nginx/ng-certs
WORKDIR /umds-store67
COPY vmware-umds-distrib/ /umds-staging
COPY umds-docker-ubuntu.sh /umds-staging
RUN chmod +x /umds-staging/umds-docker-ubuntu.sh
RUN /umds-staging/umds-docker-ubuntu.sh

ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf

VOLUME /usr/local/vmware-umds
VOLUME /umds-store67
VOLUME /etc/nginx/ng-certs
EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
