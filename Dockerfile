FROM centos:7

RUN yum upgrade -y && yum install which curl perl psmisc epel-release yum-utils vim -y
RUN yum install -y nginx
RUN mkdir /umds-store67
RUN mkdir /umds-staging
WORKDIR /umds-store67
COPY vmware-umds-distrib/ /umds-staging
COPY umds-docker.sh /umds-staging
RUN chmod +x /umds-staging/umds-docker.sh
RUN /umds-staging/umds-docker.sh

RUN mv /usr/local/vmware-umds/lib/libcurl.so.4 /usr/local/vmware-umds/lib/libcurl.so.4.backup
RUN ln -s /usr/lib64/libcurl.so.4 /usr/local/vmware-umds/lib/libcurl.so.4

ADD nginx.conf /etc/nginx/nginx.conf

VOLUME /usr/local/vmware-umds
VOLUME /umds-store67
VOLUME /etc/nginx


EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
