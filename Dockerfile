FROM golang:alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN go mod init example/hello && go build hello.go

COPY . .

FROM scratch
COPY --from=builder /usr/src/app/hello /usr/bin/hello
EXPOSE 3000
CMD ["/usr/bin/hello"]