#!/bin/bash

if [ "$CI" = true ]
then
    db=test
else
    db=$USER
fi

mysql $db -e "INSERT INTO log (message) VALUES ('Start. Building on: `uname`')"

mkdir -p build
echo '' >build/build_info.sql

for var in BUILD_NUMBER NODE_NAME JOB_NAME WORKSPACE BUILD_URL
do
    echo "INSERT INTO log (message) VALUES ('  $var=${!var}'); " >>build/build_info.sql
done
echo "INSERT INTO log (message) VALUES ('  commit=`git rev-parse HEAD`'); " >>build/build_info.sql

mysql $db <build/build_info.sql

sleep 5

mysql $db -e "INSERT INTO log (message) VALUES ('End.')"

