# elk-stack-docker

Run image

docker build -t name .

docker run \
	--restart=always \
	--name elasticsearch1 \
	-e ES_NODE_NAME=node-matheus-master \
	-e ES_NODE_MASTER=true \
	-e ES_NODE_DATA=false \
	-e ES_PUBHOST=192.168.99.100 \
	-e ES_NODES=192.168.99.101:9300 \
	-p 9200:9200 \
	-d elasticsearch/es_m
