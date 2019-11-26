docker-r-tidyverse
==================

Dockerfile for R with tidyverse

Docker image
------------

Pull the image from [Docker Hub](https://hub.docker.com/r/dceoy/r-tidyverse/).

```sh
$ docker pull dceoy/r-tidyverse
```

Usage
-----

Run a container

```sh
$ docker container run --rm -it -v ${PWD}:/work -w /work -u $(id -u):$(id -g) dceoy/r-tidyverse
```

Dependency
----------

The image uses the following tool:

- clir
  - R package manager for command line interface
  - [GitHub - dceoy/clir](https://github.com/dceoy/clir)
  - [DockerHub - dceoy/clir](https://hub.docker.com/r/dceoy/clir)
