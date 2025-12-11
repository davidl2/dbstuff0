#!/bin/bash

if [ "$CI" = true ]
then
    db=test
else
    db=$USER
fi

mysql $db -e "INSERT INTO log (message) VALUES ('Start. Building on: `uname`')"

for var in BUILD_NUMBER NODE_NAME JOB_NAME WORKSPACE BUILD_URL
do
    mysql $db -e "INSERT INTO log (message) VALUES ('  $var=${!var}')"
done

sleep 5

mysql $db -e "INSERT INTO log (message) VALUES ('End.')"

