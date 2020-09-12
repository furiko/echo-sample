FROM golang:1.14-alpine3.12

RUN apk update && \
    apk add --no-cache git && \
    apk add --no-cache make

COPY . /go/src/github.com/furiko/echo-sample
ENV GO111MODULE=on

WORKDIR /go/src/github.com/furiko/echo-sample

RUN go get github.com/pilu/fresh

CMD ["make", "run"]