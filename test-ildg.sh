# Clone / pull try-client
if [ ! -d try-client ]
then
    git clone https://gitlab.desy.de/ildg/hands-on/try-client.git
else
    cd try-client
    git pull
    cd -
fi
export PATH=`pwd`"/try-client:$PATH"

# Clone / pull material
if [ ! -d material ]
then
    git clone https://gitlab.desy.de/ildg/hands-on/material.git
else
    cd material
    git pull
    cd -
fi

# NOTE: mini-lime must be built INSIDE the container
make -C material/exercises/mini-lime/
export PATH=`pwd`"/material/exercises/mini-lime:$PATH"

try-mdc --list-ensembles


