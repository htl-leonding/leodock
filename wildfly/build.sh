#!/bin/bash
docker stop wildfly
docker rm wildfly
docker rmi htlleonding/wildfly
docker build -t htlleonding/wildfly .
