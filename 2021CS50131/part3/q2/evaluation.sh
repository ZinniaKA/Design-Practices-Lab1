#!/bin/bash
# takes input file as an argument and gives final value after all the arithmetic operations

input_file="$1"
s=0

do_arithmetic(){
    if [[ $1 =~ ^[0-9]+$ ]]; then
        case "$2" in
            "+" | "-" | "/" | "%" ) s=$(($s "$2" $1));
            ;;
            "evaluation.sh") s=$(($s "*" $1));
            ;;
            *) echo "invalid file" <&2; exit -1
        esac
    
    else 
        echo "invalid file" 1<&2 #&& [[ "$2" =~ ^("+"|"-"|"/"|"%"|"evaluation.sh")$ ]
        exit -1
    fi
    }

if [ "$input_file" = "" ]; then
    echo "no parameters passed" <&2
    exit -1

elif [[ ! -f $input_file ]]; then
    echo "path is invalid" <&2
    exit -1

else
    while read i ;do 
        if [[ ! "$i" = "" ]]; then 
            do_arithmetic $i
        fi
    done < $input_file
    echo $s
fi
