# Dockerfile for Database DEV environment of APIStockAndFabrication

FROM mysql:5.7

# Change timezone to GMT (mysql will use the system timezone)
RUN ln -sf /usr/share/zoneinfo/GMT /etc/localtime

ENV MYSQL_DATABASE=apisf_db \
    MYSQL_ROOT_PASSWORD=raiz \
    MYSQL_USER=dbwdev \
    MYSQL_PASSWORD=dbwdevpass

ADD base.sql /docker-entrypoint-initdb.d

