# vim:set ft=dockerfile:
FROM docker.elastic.co/elasticsearch/elasticsearch:7.12.1

LABEL com.jogoj.service.name="elasticsearch" \
      com.jogoj.type="elasticsearch" \
      version="0.1" \
      description=""

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN bin/elasticsearch-plugin install analysis-icu
RUN bin/elasticsearch-plugin install analysis-kuromoji

EXPOSE 9200/tcp
EXPOSE 9300/tcp
