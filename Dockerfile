FROM alpine:3.11
#FROM ubuntu
#RUN apt update && \
#    apt install -y curl html-xml-utils w3m
RUN apk add --no-cache bash curl w3m html-xml-utils
COPY ./crawler.sh /
RUN chmod +x /crawler.sh
ENTRYPOINT ["/bin/bash", "/crawler.sh"]
CMD []
