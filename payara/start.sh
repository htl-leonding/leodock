#!/bin/bash
echo 'Starting Payara'
echo deploy ${DEPLOYMENT_DIR}/`cd ${DEPLOYMENT_DIR} && ls -1 | head -1` > ${INSTALL_DIR}/deploy-command
cat ${INSTALL_DIR}/deploy-command

echo -e 'AS_ADMIN_PASSWORD=\nAS_ADMIN_NEWPASSWORD='$ADMIN_PASSWORD'\n' \
>> /opt/tmpfile

echo -e 'AS_ADMIN_PASSWORD='$ADMIN_PASSWORD'\n' \
> /opt/pwdfile

echo ---- tmpfile
cat /opt/tmpfile

echo ---- pwdfile
cat /opt/pwdfile

./asadmin start-domain && \
./asadmin --user $ADMIN_USER --passwordfile=/opt/tmpfile change-admin-password && \
./asadmin --user $ADMIN_USER --passwordfile=/opt/pwdfile enable-secure-admin && \
./asadmin stop-domain && \
./asadmin start-domain --verbose --postbootcommandfile ${INSTALL_DIR}/deploy-command ${DOMAIN_NAME}
