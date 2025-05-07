#!/bin/sh

set -a # automatically export all variables

source ~/colors.env

# PATH settings:

# add ~/PATH and . to PATH
PATH=~/PATH:$PATH:.
PYTHONPATH=/home/jack/Programmering/PATH

set +a
