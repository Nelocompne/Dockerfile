FROM golang:1.20-alpine AS builder
COPY . /src
WORKDIR /src
ARG GOPROXY=""
ENV GOPROXY ${GOPROXY}
ENV CGO_ENABLED=0
# ENV GOARCH=amd64
# ENV GOOS=linux
RUN set -ex \
    && apk add git build-base \
    && go build \
        -o /src/bin/cfddns-go
FROM alpine AS dist
RUN set -ex \
    && apk upgrade \
    && apk add bash tzdata ca-certificates \
    && rm -rf /var/cache/apk/*
COPY --from=builder /src/bin/cfddns-go /usr/local/bin/cfddns-go
ENTRYPOINT ["cfddns-go"]
