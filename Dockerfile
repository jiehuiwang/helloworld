FROM golang:1.18-alpine
RUN apk add git
WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./
COPY handlers ./handlers/

RUN CGO_ENABLED=0 GOOS=linux go build -o /helloworld

EXPOSE 3000
ENV MESSAGE="JESSIE WANG"
VOLUME [ "/tmp" ]

CMD [ "go", "run", "/app/main.go" ]
