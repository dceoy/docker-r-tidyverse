FROM ubuntu:latest

ENV CRAN_URL https://cloud.r-project.org/

RUN set -e \
      && ln -sf /bin/bash /bin/sh

RUN set -e \
      && apt-get -y update \
      && apt-get -y install apt-transport-https git libcurl4-gnutls-dev \
                            libmariadb-client-lgpl-dev libpq-dev librsvg2-bin libsqlite3-dev \
                            libssl-dev libxml2-dev pandoc

RUN set -e \
      && grep '^DISTRIB_CODENAME' /etc/lsb-release \
        | cut -d = -f 2 \
        | xargs -I {} echo "deb ${CRAN_URL}bin/linux/ubuntu {}/" \
        | tee -a /etc/apt/sources.list \
      && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 \
      && apt-get -y update \
      && apt-get -y upgrade \
      && apt-get -y install r-base \
      && apt-get -y autoremove \
      && apt-get clean

RUN set -e \
      && curl https://raw.githubusercontent.com/dceoy/clir/master/install.sh | bash

ENV PATH ${HOME}/.clir/bin:${PATH}

RUN set -e \
      && clir install --devt=cran dbplyr devtools doParallel foreach gridExtra rmarkdown tidyverse \
      && clir validate dbplyr devtools doParallel foreach gridExtra rmarkdown tidyverse

ENTRYPOINT ["/usr/bin/R"]
