FROM crystallang/crystal:latest

ADD . /src
WORKDIR /src
RUN shards build --release
RUN ls bin && cp bin/idenumapi /usr/bin/
#COPY ./bin/ /usr/bin/
ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/idenumapi"]
EXPOSE 80
