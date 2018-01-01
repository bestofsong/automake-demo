#! /bin/sh

find . ! \( -name '*.h' -o -name '*.c' \) -type f -exec rm {} \;

find . -type d -empty -exec test -d {} || rmdir {} \;

