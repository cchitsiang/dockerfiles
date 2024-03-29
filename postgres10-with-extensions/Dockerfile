FROM postgres:10-bullseye

ARG DEBIAN_FRONTEND=noninteractive

# Simple Chinese Word Segmentation
# from: https://github.com/Necolo/postgres-zhparser-docker
# zhparser
ENV SCWS_VERSION 1.2.3
RUN apt-get -q update && apt-get install -y --no-install-recommends ca-certificates wget \
    && apt-get install -y tar make gcc \
    && apt-get install -y postgresql-server-dev-$PG_MAJOR \
    && mkdir build \
    && cd build \
    && wget -q -O - http://www.xunsearch.com/scws/down/scws-$SCWS_VERSION.tar.bz2 | tar xjf -  \
    && cd scws-$SCWS_VERSION ; ./configure ; make install \
    && cd .. \
    && rm -rf scws-$SCWS_VERSION \
    && wget -q --no-check-certificate -O - https://github.com/amutu/zhparser/archive/master.tar.gz | tar xzf - \
    && cd zhparser-master ; SCWS_HOME=/usr/local make && make install ; cd .. \
    && rm -rf zhparser-master \
    && apt-get purge -y --auto-remove ca-certificates wget postgresql-server-dev-$PG_MAJOR make gcc


# postgis
# from: https://github.com/postgis/docker-postgis/blob/master/10-3.1/Dockerfile
ENV POSTGIS_MAJOR 3
ENV POSTGIS_VERSION 3.2.3+dfsg-1.pgdg110+1

RUN apt-get update \
      && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
      && apt-get install -y --no-install-recommends \
           # ca-certificates: for accessing remote raster files;
           #   fix: https://github.com/postgis/docker-postgis/issues/307
           ca-certificates \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/10_postgis.sh
COPY ./update-postgis.sh /usr/local/bin
