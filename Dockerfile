FROM node:alpine

WORKDIR /app

COPY . .

EXPOSE 3000

RUN apk update && apk upgrade && \
    apk add --no-cache unzip zip wget curl git screen && \
    chmod +x app.js && \
    npm install && \
    chmod -R 777 /app/music || true

COPY sync.sh /app/sync.sh
RUN chmod +x /app/sync.sh

CMD ["sh", "-c", "npm start & while true; do /app/sync.sh; sleep 300; done"]
