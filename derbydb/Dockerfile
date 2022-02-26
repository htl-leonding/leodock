FROM ubuntu:20.04

ENV DERBY_HOME=/derby/db-derby-10.15.2.0-bin
ENV PATH="/derby/db-derby-10.15.2.0-bin/bin:/derby/db-derby-10.15.2.0-bin/lib:${PATH}"
ENV DERBY_LIB=${DERBY_HOME}/lib
ENV CLASSPATH=${DERBY_LIB}/derby.jar:${DERBY_LIB}/derbynet.jar:${DERBY_LIB}/derbytools.jar:${DERBY_LIB}/derbyoptionaltools.jar:${DERBY_LIB}/derbyclient.jar

RUN apt update && \
    apt install -y unzip curl default-jdk && \
    apt -y clean && \
    rm -r /var/cache/apt /var/lib/apt/lists/*


RUN mkdir derby && \
    cd derby && \
    curl https://dlcdn.apache.org//db/derby/db-derby-10.15.2.0/db-derby-10.15.2.0-bin.zip -o derbydb.zip && \
    unzip derbydb.zip && \
    rm /derby/derbydb.zip && \
    mkdir /data && \
    cd /data

WORKDIR /data
EXPOSE 1527

CMD ["/derby/db-derby-10.15.2.0-bin/bin/startNetworkServer", "-noSecurityManager", "-h", "0.0.0.0"]
#CMD ["java", "-jar", "derbyrun.jar", "start", "-h", "0.0.0.0"]
#CMD ["java", "-Dderby.stream.error.field=java.lang.System.out", "org.apache.derby.drda.NetworkServerControl", "start", "-h", "0.0.0.0"]