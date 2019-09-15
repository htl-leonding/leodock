# Payara

JDK: adoptopenjdk/openjdk11

## Ermitteln des zugrundeliegenden OS

- Starten des zugrundeliegenden JDK-Container (adoptopenjdk/openjdk11)

```
docker run -d -it --rm --name jdktest adoptopenjdk/openjdk11 /bin/bash
```

| Parameter | Beschreibung |
|---|---|
| --rm | der Container wird nach Beenden automatisch gelöscht |
| -it | interaktives Terminal

- Starten einer Shell

```
docker exec -it jdktest /bin/bash
```

- Ausgeben des Betriebssystems

```
cat /etc/lsb-release
```

```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.3 LTS"
```

- Beenden der Shell

```
exit
docker stop jdktest
```

Aufgrund des Parameters --rm wird der Continer nach dem Stoppen automatisch gelöscht.

siehe auch <https://unix.stackexchange.com/a/10292>


## Build des Images

```
docker build -t htlleonding/payara .
```


## Entfernen der dangling-images

Ansehen der Images

```
docker images -f "dangling=true" -q
```

Entfernen der dangling images

```
docker rmi $(docker images -f "dangling=true" -q)
```
