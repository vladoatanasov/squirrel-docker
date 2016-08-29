FROM ubuntu

MAINTAINER Vladimir Atanasov

RUN apt-get update && apt-get install -y curl babeld net-tools iputils-ping iproute

COPY squirrel-master /tmp/squirrel-master
RUN chmod +x /tmp/squirrel-master

COPY assets/ /tmp/assets

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
