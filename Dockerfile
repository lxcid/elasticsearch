FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4

RUN elasticsearch-plugin install --batch repository-s3
COPY --chown=1000:0 bin/aws-entrypoint.sh /usr/local/bin/aws-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/aws-entrypoint.sh"]
