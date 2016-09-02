FROM phusion/baseimage:latest

ENV ES_VERSION 2.3.5

RUN curl http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo deb http://packages.elasticsearch.org/elasticsearch/2.x/debian stable main > /etc/apt/sources.list.d/elasticsearch-2.x.list

RUN apt-get update -qq \
	&& apt-get install -qqy \
		openjdk-8-jdk \
		elasticsearch=${ES_VERSION} \
	&& apt-get clean

WORKDIR /usr/share/elasticsearch

COPY elasticsearch/logging.yml /usr/share/elasticsearch/config/
COPY elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/

USER elasticsearch

ENV PATH=$PATH:/usr/share/elasticsearch/bin

EXPOSE 9200 9300

CMD ["elasticsearch"]
