#!/bin/ash

set -e

eval "$(ssh-agent)"

ash -c "$*"
