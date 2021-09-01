# kata-haskell

## Requirements
* [Haskell Stack](https://docs.haskellstack.org/en/stable/README/#how-to-install)

## Install Doctest
```shell
$ stack install doctest --resolver=lts-16.11
```

## Build
```shell
$ stack build kata-haskell
```

## Run
```shell
$ stack exec kata-haskell-exe
```

## Run [Doctest](https://hackage.haskell.org/package/doctest)
```shell
$ stack install doctest --resolver=lts-16.11
$ doctest src/Kata/*
```
