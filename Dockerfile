FROM golang:alpine as builder

WORKDIR /usr/src/app

RUN go mod init app

COPY hello-world.go .

RUN go build -o app

FROM scratch

COPY --from=builder /usr/src/app .

CMD ["./app"]