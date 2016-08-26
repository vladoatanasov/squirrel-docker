FROM ubuntu

MAINTAINER Vladimir Atanasov

COPY squirrel-worker /tmp/squirrel-worker
RUN chmod +x /tmp/squirrel-worker

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
