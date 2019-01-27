FROM python:3.7-alpine

ADD . /src
WORKDIR /src

#RUN set -e; \
        apk add --no-cache --virtual .build-deps \
                gcc \
                libc-dev \
                linux-headers \
                mariadb-dev \
                python3-dev \
                postgresql-dev \
        ;
        
#COPY ./apk_deps.sh ./apk_deps.sh
#RUN ./apk_deps.sh
        
RUN pip install -r requirements.txt
CMD ["python", "src/apisf/app.py"]
