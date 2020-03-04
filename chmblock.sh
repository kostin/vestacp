#!/bin/bash

DIR="$1"

if [ ! -d "${DIR}" ]
then
    	echo "Site dir doesnt exists!"
        exit 0
fi


find ${DIR} -type f -print0 | xargs -0 chmod 644
find ${DIR} -type d -print0 | xargs -0 chmod 755
find ${DIR}/sites/default/files/ -type d -print0 | xargs -0 chmod 777
find ${DIR}/sites/default/files/ -type f -print0 | xargs -0 chmod 666
chown -R root ${DIR}/*
