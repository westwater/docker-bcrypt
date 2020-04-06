#!/bin/bash

set -e

echo "Generate Bcrypt Hashed Passwords"

usage(){
    echo "usage: [-r ROUNDS]"
    exit 1
}

while getopts 'r:' OPT; do
  case "$OPT" in
    r) ROUNDS=${OPTARG} ;;
    *) usage ;;
  esac
done
shift "$(($OPTIND -1))"

ROUNDS=${ROUNDS:-10}

hashed=$(htpasswd -nBC ${ROUNDS} "")

echo ${hashed} | sed "s/:\$2y/\$2a/g"
