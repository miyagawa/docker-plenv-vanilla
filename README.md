## Vanilla plenv perls for Docker

Build file to build Docker image that has all Perls in its vanilla installed state.

## Get

Available from https://index.docker.io/u/miyagawa/plenv

```
> docker pull miyagawa/plenv
```

## Build yourself

```
> make build
```

This will take about 2 hours to get all the perls built.

Now you get an image called miyagawa/plenv with plenv setup for all available perls on CPAN under `/root/.plenv`.

## Test CPAN modules with Vanilla perl

Setup scripts for shell is located in `/root/.plenv.sh` and you have to source it before running the plenv command and shims.

```
docker run miyagawa/plenv -e PLENV_VERSION=5.18.0 bash -c ". /root/.plenv.sh; plenv install-cpanm; cpanm Module"
```

## Author

Tatsuhiko Miyagawa

