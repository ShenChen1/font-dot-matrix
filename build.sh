#!/usr/bin/env bash

set -e

declare -r font="default.font"
declare -r bin="./example"

python3 ./py/font-tool.py --output=${font}

gcc -g -O2 -Wall -Werror -Iinc src/example.c -o ${bin}
${bin} ${font}
rm -rf ${bin}