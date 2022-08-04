#!/bin/bash

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

ERROR_LOG(){
    echo $1 >> $err
}

# test1
echo 2 > $ans
./common_divisor.sh 2 4 > $result
diff $ans $result > /dev/null || ERROR_LOG "error in test1"

# test2
echo 37 > $ans
./common_divisor.sh 481 629 > $result
diff $ans $result > /dev/null || ERROR_LOG "error in test2"

# test3
echo "not enough arguments" > $ans
./common_divisor.sh 3 > $result
diff $ans $result > /dev/null || ERROR_LOG "error in test3"

# test4
echo "arguments is not integer" > $ans
./common_divisor.sh a b > $result
diff $ans $result > /dev/null || ERROR_LOG "error in test4"

# test5
echo "arguments is not integer" > $ans
./common_divisor.sh 4.5 8 > $result
diff $ans $result > /dev/null || ERROR_LOG "error in test5"

if [ -f $err ]; then
    cat $err
    rm /tmp/$$-*
    exit 1
fi