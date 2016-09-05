FROM anapsix/alpine-java:latest

ENV ES_VERSION 2.4.0

RUN apk add --update curl

RUN curl -o elasticsearch-${ES_VERSION}.tar.gz -sSL https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ES_VERSION/elasticsearch-$ES_VERSION.tar.gz && \
	tar -xzf elasticsearch-$ES_VERSION.tar.gz && \
	rm elasticsearch-$ES_VERSION.tar.gz && \
	mv elasticsearch-$ES_VERSION /usr/share/elasticsearch && \
  	adduser -DH -s /sbin/nologin elasticsearch && \
  	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch

WORKDIR /usr/share/elasticsearch

#COPY elasticsearch/logging.yml /usr/share/elasticsearch/config/
#COPY elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/
COPY docker-entrypoint.sh /

EXPOSE 9200 9300

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["elasticsearch"]