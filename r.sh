#!/bin/bash

usage() {
    cat <<EOS
usage: $0 [command]

commands:
    fmt  formats code
    run  runs the server
EOS
}

die() {
    echo "$0: $*"
    exit 1
}

if [[ "$#" -eq 0 ]]; then
    usage
    exit
fi

if [[ "$#" -gt 1 ]]; then
    die "too many arguments"
fi

case $1 in
    help)
        usage
        exit
        ;;
    fmt)
        cd backend && go fmt .
        ;;
    run)
        cd backend && go run .
        ;;
    *)
        die "$1: invalid command"
        ;;
esac
