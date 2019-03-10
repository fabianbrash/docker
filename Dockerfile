FROM ubuntu:14.04

RUN apt-get update -y && apt-get install -y curl perl python psmisc

RUN mkdir /umds-store67
RUN mkdir /umds-staging
WORKDIR /umds-store67
COPY vmware-umds-distrib/ /umds-staging
COPY umds-docker-ubuntu.sh /umds-staging
RUN chmod +x /umds-staging/umds-docker-ubuntu.sh
RUN /umds-staging/umds-docker-ubuntu.sh

VOLUME /usr/local/vmware-umds
VOLUME /umds-store67

 
EXPOSE 8080

CMD ["python", "-m", "SimpleHTTPServer", "8080"]


