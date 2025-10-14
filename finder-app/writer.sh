#!/bin/bash

if [ $# -ne 2 ];
then
    echo "Error: This script requires exactly 2 arguments."
    echo "Usage: $0 <arg1> <arg2>"
    echo "<arg1>: path to a file"
    echo "<arg2>: text string which will writen to file"
    exit 1
fi

writefile=$1
writestr=$2

mkdir -p "$(dirname "$writefile")"

echo "$writestr" > "$writefile"

if [ $? -ne 0 ];
then
    echo "Failed to write to file $writefile"
    exit
fi

