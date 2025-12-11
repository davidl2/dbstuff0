#!/bin/bash


mysql test -e "INSERT INTO log (message) VALUES ('Start. Building on: `uname`')"

sleep 5

mysql test -e "INSERT INTO log (message) VALUES ('End.')"

