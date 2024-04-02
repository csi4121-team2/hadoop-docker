# Usage

## How to install images

```bash
docker build -t {IMAGE_NAME} .

docker run -it --name {CONTAINER_NAME} {IMAGE_NAME}
```
or
```bash
./build.sh
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
./setup.sh

start-all.sh

...

stop-all.sh
```
