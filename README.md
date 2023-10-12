# Lattice practices image

## Start
```shell
git clone https://github.com/basbs/lap.git
```

Then, following Option 1 to download and run the pre-built container image is simplest.
However, Option 2 might preferable if download bandwidth is a problem.

## Option 1: Run container from a pre-built image (750 MB)
```shell
docker run --name lap -dt -v "$(pwd)/lap:/tmp/lap" machine1919/lap:latest
```

## Option 2: Run container from base image (80 MB) and customize (150 MB)
```shell
docker run --name lap -dt -v "$(pwd)/lap:/tmp/lap" ubuntu:latest
chmod +x lap/bootstrap0.sh
docker exec -it lap /tmp/lap/bootstrap0.sh
# Re-connect
docker exec -it lap /bin/su - lap
```

## Troubleshooting Tips
**1) Using podman**

Append an extra `:Z` to the attribute of `-v` when starting the container with `docker run`, e.g. 
```shell
   docker run --name lap -dt -v "$(pwd)/lap:/tmp/lap:Z" ubuntu:latest
```
**2) Running on Mac computers with Apple silicon**

Use `docker run` with additional option `--platform linux/amd64` when starting the container, e.g.
```shell
   docker run --platform linux/amd64 --name lap -dt -v "$(pwd)/lap:/tmp/lap" ubuntu:latest
```

## Useful commands during the workshop
- Hop out from container `exit`
- To re-connect with user name `lap`
```shell
docker exec -u lap -it lap /bin/bash
```
- To share any host folder with the container use additional options of the form `-v <host-path>:<container-path>` when starting the container with `docker run`
- To compile execute the openQCD sources 
```shell
/tmp/lap/test-qcd1.sh
```
- To restart `docker restart lap`
- To save the state of your current container (before stopping and removing it) as a new image
```shell
docker commit -m="My own lap image" lap mylap:latest
```
- To stop and remove the container (**all your data inside the container will be gone**) `docker rm -f lap`
