#!/usr/bin/bash

imagePath=$(ls -l /tmp/random_bg | grep --only-matching "/home/.*")
rm "${imagePath}"

exec ~/.local/bin/random-bg.sh
