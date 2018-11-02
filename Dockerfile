FROM dceoy/clir:latest

RUN set -e \
      && apt-get -y update \
      && apt-get -y dist-upgrade \
      && apt-get -y install --no-install-recommends --no-install-suggests \
        apt-transport-https curl gfortran libblas-dev liblapack-dev \
        libmariadb-client-lgpl-dev libpq-dev librsvg2-bin libsqlite3-dev \
        libssh2-1-dev pandoc \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN set -e \
      && clir update \
      && clir install dbplyr doParallel foreach gridExtra rmarkdown tidyverse \
      && clir validate dbplyr doParallel foreach gridExtra rmarkdown tidyverse

ENTRYPOINT ["/usr/bin/R"]
