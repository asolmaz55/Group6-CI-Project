FROM golang:1.21-alpine AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o frontend .

FROM alpine:3.19
WORKDIR /app
COPY --from=build /app/frontend .
COPY --from=build /app/static ./static
COPY --from=build /app/templates ./templates
EXPOSE 8080
ENTRYPOINT ["./frontend"]
