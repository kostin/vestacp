#!/bin/bash

DIR="$1"

if [ ! -d "${DIR}" ]
then
 echo "Please put site web root dir in parametr"
 exit 0
fi


if [ -d "${DIR}/sites/default/files/" ]
then
  echo "Detected Drupal site!"
  find ${DIR} -type f -print0 | xargs -0 chmod 644
  find ${DIR} -type d -print0 | xargs -0 chmod 755
  find ${DIR}/sites/default/files/ -type d -print0 | xargs -0 chmod 777
  find ${DIR}/sites/default/files/ -type f -print0 | xargs -0 chmod 666
  chown -R root ${DIR}/*
  exit 0
fi

if [ -d "${DIR}/wp-content/uploads/" ]
then
  echo "Detected Wordpress site!"
  find ${DIR} -type f -print0 | xargs -0 chmod 644
  find ${DIR} -type d -print0 | xargs -0 chmod 755
  find ${DIR}/wp-content/uploads/ -type d -print0 | xargs -0 chmod 777
  find ${DIR}/wp-content/uploads/ -type f -print0 | xargs -0 chmod 666
  chown -R root ${DIR}/*
  exit 0
fi

echo "Cant detect CMS and change permission automatically!"
