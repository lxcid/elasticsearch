FROM docker.elastic.co/elasticsearch/elasticsearch:6.2.4

RUN elasticsearch-plugin install repository-s3
