FROM golang:1.19.1-alpine3.16 AS go

WORKDIR /go/src/app

COPY index.go .

RUN CGO_ENABLED=0 GOOS=linux go build -o /app ./index.go

FROM scratch    

COPY --from=go /app /app

CMD ["/app"]