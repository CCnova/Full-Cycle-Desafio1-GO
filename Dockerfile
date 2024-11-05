FROM golang:1.23.2-alpine3.20 AS builder

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache upx \
  && go build main.go \
  && upx --best --ultra-brute main

FROM scratch

WORKDIR /root/

COPY --from=builder /usr/src/app/main .

ENTRYPOINT [ "./main" ]