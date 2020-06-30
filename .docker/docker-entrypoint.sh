#!/bin/ash

set -e

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent)"
fi

ash -c "$*"
