FROM r-base

ENV CRAN_URL https://cloud.r-project.org/

RUN set -e \
      && apt-get -y update \
      && apt-get -y upgrade \
      && apt-get clean

RUN set -e \
      && R -e "update.packages(ask = FALSE, repos = '${CRAN_URL}'); \
               install.packages(pkgs = c('dbplyr', 'devtools', 'docopt', 'doParallel', 'foreach', 'tidyverse'), \
                                dependencies = TRUE, repos = '${CRAN_URL}');"

ENTRYPOINT ["R"]
