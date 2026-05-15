#!/bin/sh
printf '\033c\033]0;%s\a' One Hour Game
base_path="$(dirname "$(realpath "$0")")"
"$base_path/onehourgame_linux.x86_64" "$@"
