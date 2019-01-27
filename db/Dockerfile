# Dockerfile for Database DEV environment of APIStockAndFabrication

FROM mysql:5.7

# Change timezone to GMT (mysql will use the system timezone)
RUN ln -sf /usr/share/zoneinfo/GMT /etc/localtime

COPY init-files/ /opt
COPY setup-databases.sh /docker-entrypoint-initdb.d

