#!/bin/bash

DIR="$1"

if [ ! -d "${DIR}" ]
then
 echo "Please put site public_html dir in param without trail slash"
 exit 0
fi


if [ -d "${DIR}/web_root/sites/default/files/" ]
then
  echo "Detected Drupal site!"
  find ${DIR} -type f -exec chmod 644 {} \;
  find ${DIR} -type d -exec chmod 755 {} \;
  find ${DIR}/web_root/sites/default/files/ -type d -exec chmod 777 {} \;
  find ${DIR}/web_root/sites/default/files/ -type f -exec chmod 666 {} \;
  chown -R root:root ${DIR}/*
  find ${DIR} -type f -iname '.htaccess' -exec chmod 0644 {} \;
  exit 0
fi

if [ -d "${DIR}/web_root/wp-content/uploads/" ]
then
  echo "Detected Wordpress site!"
  find ${DIR} -type f -exec chmod 644 {} \;
  find ${DIR} -type d -exec chmod 755 {} \;
  find ${DIR}/web_root/wp-content/uploads/ -type d -exec chmod 777 {} \;
  find ${DIR}/web_root/wp-content/uploads/ -type f -exec chmod 666 {} \;
  chown -R root:root ${DIR}/*
  find ${DIR} -type f -iname '.htaccess' -exec chmod 0644 {} \;
  exit 0
fi

echo "Cant detect CMS and change permission automatically!"
