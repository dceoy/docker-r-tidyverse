FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

ADD https://raw.githubusercontent.com/dceoy/clir/master/install.sh /tmp/install.sh

RUN set -e \
      && ln -sf /bin/bash /bin/sh

RUN set -e \
      && apt-get -y update \
      && apt-get -y dist-upgrade \
      && apt-get -y install --no-install-recommends --no-install-suggests \
                            apt-transport-https apt-utils curl g++ gcc gfortran git \
                            libblas-dev libcurl4-gnutls-dev liblapack-dev \
                            libmariadb-client-lgpl-dev libpq-dev librsvg2-bin libsqlite3-dev \
                            libssh2-1-dev libssl-dev libxml2-dev pandoc r-base \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN set -e \
      && bash /tmp/install.sh --root \
      && rm -f /tmp/install.sh

RUN set -e \
      && clir update \
      && clir install --devt=cran dbplyr doParallel foreach gridExtra rmarkdown tidyverse \
      && clir validate dbplyr doParallel foreach gridExtra rmarkdown tidyverse

ENTRYPOINT ["/usr/bin/R"]
