FROM golang:latest AS builder

WORKDIR /usr/src/app

RUN go mod init desafio-go && go mod tidy

COPY . .
RUN go build

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .

CMD [ "./desafio-go" ]
