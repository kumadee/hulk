FROM golang:1-alpine
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hulk .

FROM alpine:latest
COPY --from=0 /app/hulk /usr/bin/hulk
ENTRYPOINT ["hulk"]
CMD ["--help"]
