#!/usr/bin/env bash

if [[ -f ~/.recordpid ]]; then
    pid="$(cat ~/.recordpid | head -n 1 | tr -d "\n")"
    file="$(cat ~/.recordpid | tail -n 1 | tr -d "\n")"
    kill -15 "$pid"
    file_basename="$(basename $file)"
    file_dirname="$(dirname $file)"
    basename_without_extension="${file_basename%.*}"
    fullpath_no_extension="$file_dirname/$basename_without_extension"
    # installed whisper with uv
    /home/price/.local/bin/whisper "${file}" --threads 32 --language English --task transcribe --output_dir $file_dirname --output_format txt --verbose False
    echo "$fullpath_no_extension.txt"
    cat "$fullpath_no_extension.txt" | xclip -selection c
    # JIC
    sleep 0.1
    rm -f ~/.recordpid
    notify-send -t 1000 "Recording" "Finished recording audio"
else
    echo "This does not exist"
fi
