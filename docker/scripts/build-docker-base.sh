#!/bin/bash
# This script builds the minion base. Should be run from this folder

show_usage() {
  echo "$0 <tag>"
  exit 255
}

if [ -z $1 ]; then
  show_usage
fi

tag=$1
docker build --tag compscidr/ubuntu-salt-minion:$tag -f ../Dockerfile.minion .
