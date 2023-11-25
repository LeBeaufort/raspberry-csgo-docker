#!/bin/bash

extra_args=$1
cmd=$"./srcds_run -console -usercon $extra_args"

echo "Here the extra args : $extra_args "
echo "The final command will be : $cmd "

echo "checking if we should install csgo server"
if [ -d "/csgo" ]; then
    echo "folder /csgo exist"
	echo "checking the size"
	folder_size=$(du -shb /chemin/vers/ton/dossier | awk '{print $1/1024/1024/1024}')
	if (( $(echo "$folder_size > 30" | bc -l) )); then
    echo "Size over 30gb, no install to do"
else
    echo "Size under 30gb, installing..."
	"/steamCMD/steamcmd.sh" +runscript /install-script.txt +force_install_dir /csgo/
fi

	
else
    echo "The folder /csgo does not exist \n We need to install the server"
	"/steamCMD/steamcmd.sh" +runscript /install-script.txt +force_install_dir /csgo/
fi


cd /csgo/
echo "we are in echo we are in $(pwd)"

eval $cmd