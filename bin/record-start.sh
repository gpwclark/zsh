#!/usr/bin/env bash

# #!/usr/bin/env slosh
# (def meow $(sh "date '+recording-%m-%d-%H:%M:%S.wav'"))
# (let ([pid, out] (sh "echo 'meow'" :>))
# 	(prn "Pid " pid " out, " out))
# 
# (def [pid, meow] (sh "echo 'meow'"))
# (prn "MEOW " meow)
# nohup arecord -f cd --max-file-time=300 "/tmp/clips/$file" &> /dev/null &
# && notify-send -t 1000 "Recording" "Wrote recording"
# nohup arecord -f cd --max-file-time=300 -t wav -D pulse /tmp/recording.wav 

default_source=$(pactl list short sources | grep -i "alsa_input.*Blue_Microphones" | cut -f 1 | tr -d "\n")
pactl set-default-source $default_source

if [[ ! -f ~/.recordpid ]]; then
    mkdir -p /tmp/clips/
    file="$(date '+recording-%m-%d-%H:%M:%S.wav')"
    fullpath="/tmp/clips/$file"
    nohup arecord -f cd -t wav -D pulse "$fullpath" &> /dev/null &
    echo "$!" > ~/.recordpid
    echo "$fullpath" >> ~/.recordpid
else
    echo "already running" >&2
fi
