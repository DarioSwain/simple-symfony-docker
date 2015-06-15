#!/bin/bash

rm -rf /var/www/project/app/cache/*
rm -rf /var/www/project/app/logs/*

if [ ! -d /var/www/project/vendor ]; then
   composer install
fi

/bin/bash -l -c "$*"