#! /bin/sh
set -e
echo "apk add --no-cache --virtual .build-deps gcc libc-dev linux-headers mariadb-dev python3-dev"
apk add --no-cache --virtual .build-deps gcc libc-dev linux-headers mariadb-dev python3-dev
echo "pip install mysqlclient"
pip install mysqlclient
echo "apk del .build-deps"
apk del .build-deps
#apk add --no-cache mariadb-client-libs 
