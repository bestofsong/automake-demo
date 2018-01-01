#! /usr/bin/env bash

find . ! \( -name '*.h' -o -name '*.c' -o -name '*.sh' -o -name '*.cc' \) -type f ! -regex '^\./\.git/.*' -exec rm {} \;

find . -type d -empty ! -regex '^\./\.git/.*' -exec rmdir {} \;

