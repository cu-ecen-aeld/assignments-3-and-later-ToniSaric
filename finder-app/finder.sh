#!/bin/bash

if [ $# -ne 2 ];
then
    echo "Error: This script requires exactly 2 arguments."
    echo "Usage: $0 <arg1> <arg2>"
    echo "<arg1>: path to a directory"
    echo "<arg2>: text string which will be searched within these files"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ -d "$filedir" ];
then
    echo "$filedir does not represent a directory on the filesystem"
    exit 1
fi

filecount=$(find "$filesdir" -type f | wc -l)
matchcount=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $filecount and the number of matching lines are $matchcount"