FROM alpine:latest

RUN apk add --update ca-certificates build-base ruby ruby-dev sqlite sqlite-dev openssl openssl-dev && rm -rf /var/cache/apk/*

RUN gem install json io-console gemstash:1.0.2 --no-ri --no-rdoc
RUN mkdir ~/.gemstash && echo -e > ~/.gemstash/config.yml "\
--- \n\
:base_path: '/data'"

VOLUME "/data"

EXPOSE 9292

CMD ["/usr/bin/gemstash", "start", "--no-daemonize"]
