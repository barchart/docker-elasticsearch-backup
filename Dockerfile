#
# Elasticsearch backup job
#
# docker-build properties:
# TAG=barchart/elasticsearch-backup:latest

FROM barchart/cron
MAINTAINER Jeremy Jongsma "jeremy@barchart.com"

RUN apt-get --yes update && \
	apt-get --yes install curl && \
	apt-get clean && \
	pip install elasticsearch-curator

ADD cron.d/ /etc/cron.d
ADD bin/ /usr/local/bin
RUN mkdir -p /var/log/ext/misc

# ES configuration vars
ENV ES_REPOSITORY_NAME backup
ENV ES_REPOSITORY_PRUNE 7
ENV ES_HOST elasticsearch
ENV ES_PORT 9200
ENV ES_GLOBAL_STATE true
ENV ES_IGNORE_UNAVAILABLE true
