#!/bin/bash


mysql test -e "INSERT INTO log (message) VALUES ('Start. Building on: `uname`')"

for var in BUILD_NUMBER NODE_NAME JOB_NAME WORKSPACE BUILD_URL
do
    mysql test -e "INSERT INTO log (message) VALUES ('  $var=${!var}')"
done

sleep 5

mysql test -e "INSERT INTO log (message) VALUES ('End.')"

