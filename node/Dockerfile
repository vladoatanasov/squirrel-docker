FROM ubuntu

MAINTAINER Vladimir Atanasov

ENV HTTP_PROXY=http://10.1.2.102:8080
ENV HTTPS_PROXY=http://10.1.2.102:8080

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
