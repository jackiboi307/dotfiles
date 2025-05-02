#!/bin/bash

for i in $1/*; do
    # sox -r 8000 -e unsigned -b 16 -c 1 "$i" "$i_modified"
    play "$i"
    sleep 0.1
done
