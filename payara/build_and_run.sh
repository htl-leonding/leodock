#!/bin/sh
NAME=payara
docker kill ${NAME}
docker rm ${NAME}
docker rmi htlleonding/${NAME}
docker build -t htlleonding/${NAME} .
docker run -d -p 4848:4848 -p 8080:8080 --name payara htlleonding/payara && docker logs -f payara
