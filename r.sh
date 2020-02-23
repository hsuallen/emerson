#!/bin/bash

usage() {
    cat <<EOS
usage: $0 [command]

commands:
    fmt  formats code
    go   runs the go backend server
    ng   runs the angular dev server
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
    go)
        cd backend && go run .
        ;;
    ng)
        cd frontend && npx ng serve --host 0.0.0.0 --disableHostCheck=true
        ;;
    *)
        die "$1: invalid command"
        ;;
esac
