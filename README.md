# Usage

## How to build image

```bash
docker build -t {IMAGE_NAME} .

docker run -it --name {CONTAINER_NAME} {IMAGE_NAME}
```
or
```bash
./build.sh
```

## How to install image

```bash
docker pull ghcr.io/csi4121-team2/hadoop:latest
```

## How to attach docker container

```bash
docker attach {CONTAINER_NAME}
```
or
```bash
./run.sh
```

## How to detach docker container

`Ctrl + p` `Ctrl + q`

## After running docker container

```bash
start-all.sh

...

stop-all.sh
```
