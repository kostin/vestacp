#!/bin/bash
# Adding php wrapper
user="$1"
domain="$2"
ip="$3"
home_dir="$4"
docroot="$5"

wrapper_script='#!/usr/bin/php74-cgi -c/etc/opt/remi/php74/php.ini'
wrapper_file="$home_dir/$user/web/$domain/cgi-bin/php74"

echo "$wrapper_script" > $wrapper_file
chown $user:$user $wrapper_file
chmod -f 751 $wrapper_file

exit 0
