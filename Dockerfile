FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV R_LIBS_USER /root/.clir/r/library
ENV PATH /root/.clir/bin:${PATH}

RUN set -e \
      && ln -sf /bin/bash /bin/sh

RUN set -e \
      && apt-get -y update \
      && apt-get -y upgrade \
      && apt-get -y install --no-install-recommends --no-install-suggests \
                            apt-transport-https apt-utils curl g++ gcc gfortran git \
                            libblas-dev libcurl4-openssl-dev liblapack-dev \
                            libmariadb-client-lgpl-dev libpq-dev librsvg2-bin libsqlite3-dev \
                            libssh2-1-dev libssl-dev libxml2-dev pandoc r-base \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN set -e \
      && curl -sS https://raw.githubusercontent.com/dceoy/clir/master/install.sh | bash \
      && clir update \
      && clir install --devt=cran dbplyr doParallel foreach gridExtra rmarkdown tidyverse \
      && clir validate dbplyr doParallel foreach gridExtra rmarkdown tidyverse

ENTRYPOINT ["/usr/bin/R"]
