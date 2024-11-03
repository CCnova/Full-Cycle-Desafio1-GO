FROM golang:1.23.2-alpine3.20 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /root/

COPY --from=builder /usr/src/app/main .

ENTRYPOINT [ "./main" ]