#!/bin/bash

set -e

echo "Generate Bcrypt Hashed Passwords"

usage(){
    echo "usage: [-r ROUNDS] [-p PASSWORD]"
    exit 1
}

while getopts 'r:p:' OPT; do
  case "$OPT" in
    r) ROUNDS=${OPTARG} ;;
    p) PASSWORD=${OPTARG} ;;
    *) usage ;;
  esac
done
shift "$(($OPTIND -1))"

ROUNDS=${ROUNDS:-10}

if [[ -z "${PASSWORD}" ]]; then
    hashed=$(htpasswd -nBC ${ROUNDS} "")
else
    hashed=$(htpasswd -nbBC ${ROUNDS} "" "${PASSWORD}")
fi

echo ${hashed} | sed "s/:\$2y/\$2a/g"
