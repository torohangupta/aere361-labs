# AerE 361 Lab 6
# Spring 2021
# Professor Nelson
# Shell Test Script
# DO NOT EDIT THIS SCRIPT
FILEEXE="order_test"
FILESRC="order_test.c"

tput setaf 6
echo "Testing Exercise 2"
echo


if [ -s $FILESRC ];
	then
  	echo -e "Checking that $FILESRC is not empty....OK"
    if grep -q "tic" $FILESRC && grep -q "clock()" $FILESRC;
    then
      echo -e "Validating that tic and clock() is in $FILESRC....OK"
    else
      echo -e "Validating that tic and clock() is in $FILESRC....FAILED"
      exit 1
		fi
else
    echo -e "Checking that $FILESRC is not empty....FAILED"
    exit 1
fi

# Test 1
one_ex_test=$(echo -ne '5\n' | ./$FILEEXE )
one_ex_test_status=$?

if [ ${one_ex_test_status} -eq 0 ]
  then
    tput setaf 2
    echo "Program $FILEEXE Execution Test 1....OK"
  else
    tput setaf 1
    echo "Program $FILEEXE Execution Test 1....FAILED"
    tput setaf 7
    echo "Program $FILEEXE failed to run, cleaning up files."
    rm $FILEEXE >/dev/null
    exit 1
fi

echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm $FILEEXE >/dev/null
exit 0
