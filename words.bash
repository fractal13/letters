#!/bin/bash

file=$( tempfile )
dictionary=/usr/share/dict/british-english
dictionary=/usr/share/dict/words

letters="$1"

if [ ! -r "$dictionary" ]; then
    echo "Could not find dictionary at $dictionary"
    exit 1
fi
if [ -z "$letters" ]; then
    echo "usage: $0 letters"
    exit 1
fi

./permutations "$letters" | sed -r 's/(.*)/^\1$/'> $file
#egrep -i -f $file $dictionary | awk '{if( length($0) >=3 ) { print tolower($0);} }'  | sort | uniq
egrep -f $file $dictionary | awk '{if( length($0) >=3 ) { print tolower($0);} }'  | sort | uniq

rm -f $file
