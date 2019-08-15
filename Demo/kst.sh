#!/bin/bash
set -e

main() {
  if isWindows; then
    [[ ! -f kst.zip ]] \
      && curl -L -o kst.zip 'https://raw.githubusercontent.com/Kst-plot/kst-build/Kst-32bit-3rdparty-plugins-Qt5/Kst-2.0.x-2019.02.06-17.17-win32.zip'

    ls Kst-2* 2>/dev/null 1>/dev/null \
      || unzip kst.zip

    find . -name 'kst2.exe' -exec {} "$@" \;
  else
    kst2 "$@"
  fi
}

isWindows() {
  [[ ! -z $WINDIR ]]
}

main "$@"
