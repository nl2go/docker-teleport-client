#!/bin/sh

set -e

eval "$(ssh-agent)"

ash -c "$*"
