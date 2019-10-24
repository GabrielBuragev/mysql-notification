#!/bin/bash
SRC_FOLDER="${PWD}/mysql-plugin/src"

gcc -c -Wall -fpic "${SRC_FOLDER}/mysql-notification.c" -o "${SRC_FOLDER}/mysql-notification.o" -I/usr/include/mariadb
gcc -shared -o "${SRC_FOLDER}/mysql_notification.so" "${SRC_FOLDER}/mysql-notification.o"

npm install

PLUGIN_DIR=`mysql_config --plugindir`
echo "${PLUGIN_DIR}"
cp "${SRC_FOLDER}/mysql_notification.so" "${PLUGIN_DIR}/"