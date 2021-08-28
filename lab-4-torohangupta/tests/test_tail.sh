#/bin/bash
# AerE 361 Lab 4
# Spring 2021
# Professor Nelson
# Tail Test Script
# DO NOT EDIT THIS SCRIPT
FILE_SRC="tail.c"
FILE_EXE="tail"
FILE_TEST="number_list.txt"
tput setaf 6
echo "Starting tests..."
echo

# Store the expected output
one_expected_output="98
99
100"

#Run our programs and store the results

# Test 1
one_ex_test=$(./$FILE_EXE $FILE_TEST 3)
one_ex_test_status=$?

if [ ${one_ex_test_status} -eq 0 ]
then
  tput setaf 2
  echo "Running Program Test 1 ....OK"
else
  tput setaf 1
  echo "Running Program Test 1 ....FAILED"
  tput setaf 7
  echo "Program 1 failed to run, cleaning up files."
  rm  $FILE_EXE >/dev/null
  exit 1
fi

if [ -s $FILE_SRC ];
	then
  	echo -e "Checking that $FILE_SRC is not empty....OK"
		if [ -s $FILE2 ];
			then
			echo -e "Checking that $FILE_TEST is not empty...OK"
    	if grep -q "10" $FILE_TEST && grep -q "50" $FILE_TEST && grep -q "90" $FILE_TEST;
    		then
      		echo -e "Validating values stored in $FILE_TEST....OK"
    		else
      	echo -e "Validating values stored in $FILE_TEST....FAILED"
				echo "Program failed validation, cleaning up files."
  			rm  $FILE_EXE >/dev/null
      	exit 1
			fi
		else
			echo -e "Checking that $FILE_TEST is not empty....FAILED"
			echo "Program failed validation, cleaning up files."
  		rm  $FILE_EXE >/dev/null
			exit 1
		fi
else
    echo -e "Checking that $FILE_TEST is not empty....FAILED"
		echo "Program failed validation, cleaning up files."
  	rm  $FILE_EXE >/dev/null
    exit 1
fi

if [ "$one_ex_test" == "$one_expected_output" ] ; then
    tput setaf 2
    echo "Testing output from program....PASS"
  else
    tput setaf 1
    echo "Testing output from program....FAIL"
    echo "Fail: Expected $one_expected_output but got: $one_ex_test"
    tput setaf 7
    echo "Cleaning up files..."
    rm $FILE >/dev/null
    exit 1
  fi

echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm  $FILE_EXE >/dev/null
exit 0
