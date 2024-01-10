#!/bin/bash

extra_args=$1
cmd=$"./srcds_run -console -usercon $extra_args"

echo "Here the extra args : $extra_args "
echo "The final command will be : $cmd "

echo "Installing csgo game server"
/steamCMD/steamcmd.sh +runscript /install-script.txt +force_install_dir /csgo/


cd /csgo/
echo "we are in $(pwd)"

eval $cmd