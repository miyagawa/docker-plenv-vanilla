## Vanilla plenv perls for Docker

Build file to build Docker image that has all Perls in its vanilla installed state.

## Build yourself

You can customize the list of perls in `perls.txt`.

```
> docker build . -t miyagawa/plenv
```

Now you get an image called miyagawa/plenv with plenv setup for all available perls on CPAN under `/root/.plenv`.

## Test CPAN modules with Vanilla perl

Setup scripts for shell is located in `/etc/profile.d/plenv.sh` and you have to source it before running the plenv command and shims.

```
docker run -e PLENV_VERSION=5.18.0 miyagawa/plenv bash -c ". /etc/profile.d/plenv.sh; plenv install-cpanm; cpanm Module"
```

## Author

Tatsuhiko Miyagawa

