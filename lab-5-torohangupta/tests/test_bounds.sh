#/bin/bash
# AerE 361 Lab 5
# Spring 2021
# Matt Kreul
# Professor Nelson
# bounds Test Script
# DO NOT EDIT THIS SCRIPT
FILE_SRC="bounds.c"
FILEEXE="bounds"
FILEOUT="ans.out"
tput setaf 6
echo "Starting tests..."
echo

#Run our programs and store the results

#Array to hold our prefixes
elements=( one two three )
#Run our programs and store the results
# Test 1
one_ex_test=$(./$FILEEXE 250 17)
one_ex_test_status=$?
# Test 2
two_ex_test=$(./$FILEEXE 145 28)
two_ex_test_status=$?
# Test 3
three_ex_test=$(./$FILEEXE 130 129)
three_ex_test_status=$?
# Store the expected output
one_expected_output="Your number is: 1622.333374"
two_expected_output="Your number is: 7291.000000"
three_expected_output="Your number is: 715435.687500"

if [ -s $FILEOUT ];
	then
  	echo -e "Checking that $FILEOUT is not empty....OK"
    if grep -q "1111.66663" $FILEOUT && grep -q "30331.66602" $FILEOUT;
    then
      echo -e "Validating data in $FILEOUT....OK"
    else
      echo -e "Validating data in $FILEOUT....FAILED"
      exit 1
		fi
else
    ex3=" No "
    echo -e "Checking that $FILEOUT is not empty....FAILED"
    exit 1
fi


for number in ${elements[@]}
do
current_status=$number\_ex_test_status
  if [ ${!current_status} -eq 0 ]
  then
    tput setaf 2
    echo "Running Program Test $number ....OK"
  else
    tput setaf 1
    echo "Running Program Test $number ....FAILED"
    tput setaf 7
    echo "Program $number failed to run, cleaning up files."
    rm $FILEEXE $FILEOUT >/dev/null
    exit 1
  fi
done
#echo "Using numerical values of 101, $test1, 16, $test2, and $test3"
for number in ${elements[@]}
do
current_test=$number\_ex_test
  current_out=$number\_expected_output
  if [ "${!current_test}" == "${!current_out}" ] ; then
    tput setaf 2
    echo "Logic test condition $number using value of ....PASS"
  else
    tput setaf 1
    echo "Logic test condition $number....FAIL"
    echo "Fail: Expected ${!current_out} but got: ${!current_test}"
    tput setaf 7
    echo "Cleaning up files..."
    rm $FILEEXE $FILEOUT >/dev/null
    exit 1
  fi
done
echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm $FILEEXE $FILEOUT >/dev/null
exit 0