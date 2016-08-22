
#Install ElasticSearch

FROM elasticsearch:latest

COPY elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/
COPY elasticsearch/logging.yml /usr/share/elasticsearch/config/

EXPOSE 9200
EXPOSE 9300