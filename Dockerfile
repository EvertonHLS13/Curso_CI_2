# Etapa de build
FROM golang:1.21 AS builder
WORKDIR /app
COPY . .
RUN go build -o programa .

# Etapa final
FROM ubuntu:latest
WORKDIR /app

# Variáveis de ambiente usadas no Go
ENV DB_HOST=localhost \
    DB_USER=root \
    DB_PASSWORD=root \
    DB_NAME=root \
    DB_PORT=5432

# Copia o binário gerado na etapa anterior
COPY --from=builder /app/programa /app/programa

EXPOSE 8000

CMD ["./programa"]
