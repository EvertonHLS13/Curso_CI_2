FROM ubuntu:latest

WORKDIR /app

# Variáveis de ambiente usadas no Go
ENV DB_HOST=localhost \
    DB_USER=root \
    DB_PASSWORD=root \
    DB_NAME=root \
    DB_PORT=5432

# Copia o binário
COPY ./main.exe /app/main

# Porta da aplicação
EXPOSE 8000

# Executa o binário
CMD ["./main"]