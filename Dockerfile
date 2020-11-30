FROM crystallang/crystal:latest

ADD . /src
WORKDIR /src
RUN shards build --release
COPY bin/idenumapi /usr/bin/idenumapi
ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/cerebrum"]
EXPOSE 80
