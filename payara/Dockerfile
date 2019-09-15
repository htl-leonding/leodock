FROM adoptopenjdk/openjdk11
LABEL maintainer="Thomas Stütz" description="Payara5 Server Full"

ENV PAYARA_ARCHIVE payara5
ENV DOMAIN_NAME domain1
ENV INSTALL_DIR /opt
ENV ADMIN_USER admin
ENV ADMIN_PASSWORD passme

RUN useradd -b /opt -s /bin/sh -d ${INSTALL_DIR} serveradmin && echo serveradmin:serveradmin | chpasswd
COPY payara-5.193.zip ${INSTALL_DIR}/${PAYARA_ARCHIVE}.zip
RUN apt-get update \
    && apt-get install -y unzip \
#    && curl -o ${INSTALL_DIR}/${PAYARA_ARCHIVE}.zip -L https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.193/payara-5.193.zip \
    && unzip ${INSTALL_DIR}/${PAYARA_ARCHIVE}.zip -d ${INSTALL_DIR} \
    && rm ${INSTALL_DIR}/${PAYARA_ARCHIVE}.zip \
    && chown -R serveradmin:serveradmin /opt \
    && chmod -R a+rw /opt \
    && apt-get clean

ENV PAYARA_HOME ${INSTALL_DIR}/${PAYARA_ARCHIVE}/glassfish
ENV DEPLOYMENT_DIR ${INSTALL_DIR}/deploy
RUN mkdir ${DEPLOYMENT_DIR}
WORKDIR ${PAYARA_HOME}/bin

COPY start.sh .
RUN chmod a+x start.sh
# ENTRYPOINT start.sh
CMD ["./start.sh"]
USER serveradmin
EXPOSE 4848 8009 8080 8181
