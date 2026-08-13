FROM golang:1.16 AS build

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 go build -o backend .

FROM alpine:3.19

WORKDIR /app

COPY --from=build /app/backend .

EXPOSE 9000

ENTRYPOINT ["./backend"]