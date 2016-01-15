#!/bin/bash

inotifywait -mr -e create ./ | while read dir event file; do
    if [[ $file =~ .*\.tex ]]
    then
        make && notify-send "Latex document compiled" || notify-send "Latex error"
    fi
done
