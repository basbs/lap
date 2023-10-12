# Lattice practices image

## Start
```shell
git clone https://github.com/basbs/lap.git
```

## Option 1: Run container from base image (80 MB) and customize (150 MB)
```shell
docker run --name lap -dt -v "$(pwd)/lap:/tmp/lap" ubuntu:latest
chmod +x lap/bootstrap0.sh
docker exec -it lap /tmp/lap/bootstrap0.sh
# Re-connect
docker exec -it lap /bin/su - lap
```

## Option 2: Run container from a pre-built image (750 MB)
```shell
docker run --name lap -dt -v "$(pwd)/lap:/tmp/lap" ubuntu:latestmachine1919/lap:latest
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
