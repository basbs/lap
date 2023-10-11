# Lattice practices image

## Usage

### Run a container from an image
```shell
docker run --name lap -dt machine1919/lap:latest
```
- To share any host folder with container `docker run --name lap -dt -v <host-path>:<container-path> machine1919/lap:latest`
### Using container
- To hop in `docker exec -it lap /bin/bash`
- To hop out `exit`
- To reconnect `docker exec -it lap /bin/bash`
- To restart `docker restart lap`
- To stop and remove the container (**all your data inside the container will be gone**) `docker rm -f lap`

### Save changes on your container (run this at host not inside container)
To save your current container state as a new image.
```shell
docker commit -m="My own lap image" lap mylap:latest
```

## Run using base image
```shell
git clone https://github.com/basbs/lap.git
docker run --name lap -dt -v ./lap/:/tmp/lap ubuntu:latest
docker exec -it lap /bin/bash
# Inside the container
chmod +x /tmp/lap/bootstrap.sh
/tmp/lap/bootstrap.sh
cd 
make -C openQCD-2.0/main/ GCC=mpicc
mkdir log dat cnfg
mpirun -n 2 openQCD-2.0/main/qcd1 -i /tmp/lap/qcd1.in
```

## Useful commands during workshop
- To compile execute the openQCD sources 
```shell
cd 
make -C openQCD-2.0/main/ GCC=mpicc
mkdir log dat cnfg
mpirun -n 2 openQCD-2.0/main/qcd1 -i /tmp/qcd1.in
```
