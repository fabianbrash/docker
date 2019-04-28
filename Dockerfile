FROM ubuntu:18.04

MAINTAINER Fabian Brash

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl perl psmisc nginx \
&& apt-get clean && echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir /umds-store67
RUN mkdir /umds-staging
WORKDIR /umds-store67
COPY vmware-umds-distrib/ /umds-staging
COPY umds-docker-ubuntu.sh /umds-staging
RUN chmod +x /umds-staging/umds-docker-ubuntu.sh
RUN /umds-staging/umds-docker-ubuntu.sh

ADD default /etc/nginx/sites-available/default

VOLUME /usr/local/vmware-umds
VOLUME /umds-store67


EXPOSE 80

CMD ["nginx"]

