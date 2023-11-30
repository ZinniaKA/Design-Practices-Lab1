#!/bin/bash

# Count the number of text files starting with a given prefix within a given directory

pathname="$1"
prefix="$2"
recursive="$3"
if [ -d "$pathname" ]; then
    if [ "$prefix" = "" ] ; then
        case "$recursive" in
            true | false) find "$pathname" -name "$prefix*.txt" | wc -l ;;
            *) echo "recursive should take only true or false values" <&2
             exit -1
        esac
    elif [ "$recursive" = "true" ]; then
        find "$pathname" -name "$prefix*.txt" | wc -l
    elif [ "$recursive" = "false" ]; then
        ls -al "$pathname""/"$prefix*.txt | wc -l
    else
        echo "recursive should take only true or false values" <&2
        exit -1
    fi    
else
    echo "$pathname  is not a directory" <&2
    exit -1
fi

exit 0
