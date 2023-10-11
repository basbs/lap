if [ ! -d openQCD-2.0 ]
then
    wget -O - http://luscher.web.cern.ch/luscher/openQCD/openQCD-2.0.tar.gz | tar -zxf -
fi
make -C openQCD-2.0/main/  GCC=mpicc  qcd1     

old=""
for d in log dat cnfg
do
    if [ -d $d ]
    then
       old="$old $d"  
    else
        mkdir $d
    fi
done

if [ "$old" = "" ]
then
    mpirun -n 2 openQCD-2.0/main/qcd1 -i /tmp/lap/test-qcd1.in
else
    ls -lrt $old
    echo "ERROR: Remove existing directories before running: $old"
fi

