#!/bin/bash
set -e

main() {
  trackLogs \
    | awk '{ print $1", "$2; fflush() }' \
    | tee -a markers.csv
}

trackLogs() {
  inotifywait -r -m -e create ./ \
    | awk '$3 ~ /^markers.*log$/ { print $1"/"$3; fflush() }' \
    | while read -r path; do
        tail -f "$path" &
        pid=$!
        (sleep 1m; kill $pid) &
      done
}

inotifywait() {
  if isWindows; then
    buildINotifyWait
    ./inotifywait.exe $@
  else
    inotifywait $@
  fi
}

isWindows() {
  [[ -z $WINDIR ]] && echo 0 || echo 1
}

buildINotifyWait() {
  if [[ ! -d inotify-win ]]; then 
    git clone --depth 1 https://github.com/thekid/inotify-win.git &>2
  fi
  
  if [[ ! -f inotifywait.exe ]]; then
    csc=$(find "$WINDIR/Microsoft.NET" -name 'csc.exe' | tail -n1 | sed 's/C:\\/\/c\//') 
    (cd inotify-win; "$csc" '/target:exe' '//out:..\inotifywait.exe' 'src\*.cs') &>2
  fi
}

main
