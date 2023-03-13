FROM alpine:latest

RUN apk --no-cache add lftp

COPY deploy.sh /deploy.sh

RUN ["/bin/chmod", "+x", "/deploy.sh"]

ENTRYPOINT ["/deploy.sh"]