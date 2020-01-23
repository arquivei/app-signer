FROM debian:stretch

USER root

RUN apt-get update && apt-get install osslsigncode -y

COPY docker-entrypoint.sh /

RUN chmod +x docker-entrypoint.sh

CMD ["bash"]