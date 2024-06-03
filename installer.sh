#!/bin/bash

print_color() {
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo -e "\033[${1}m${timestamp} - ${2}\033[0m"
}

print_error() {
  print_color "31" "ERROR: $1"
}


# Kill existing instances of Script Ware M
pids=$(pgrep -f "MacWare")
if [ -z "$pids" ]; then
  print_color "32" "MacWare already closed!"
else
    while IFS= read -r pid; do
        print_color "33" "Terminating MacWare instance with pid: $pid"
        kill "$pid"
    done <<< "$pids"
    print_color "32" "MacWare closed."
fi

cd ~
cd /Applications
