#!/bin/bash

val1=$1
val2=$2

if [ $# -ne 2 ]; then
    echo "not enough arguments"
    exit 1
fi

expr "$val1" + "$val2" &> /dev/null 
ret=$?
if [ $ret -gt 1 ]; then
    echo "arguments is not integer"
    exit 1
fi

rec(){
    gt=$1
    lt=$2

    mod=$(($gt % $lt))
    if [ $mod -eq 0 ];then
        return $lt
    else
        rec $lt $mod
    fi
}

if [ $val1 -gt $val2 ]; then
    rec $val1 $val2
    echo $?
elif [ $val1 -lt $val2 ]; then
    rec $val2 $val1
    echo $?
else
    echo $val1
fi
