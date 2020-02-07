FROM golang:1.13-alpine as builder

WORKDIR /app
ADD . .
RUN go mod download 
RUN go build -o hello-nats-subs


FROM alpine:3.11

RUN apk --no-cache add ca-certificates
WORKDIR /home/euiko/
COPY --from=builder /app/hello-nats-subs .
ENTRYPOINT [ "/home/euiko/hello-nats-subs" ]