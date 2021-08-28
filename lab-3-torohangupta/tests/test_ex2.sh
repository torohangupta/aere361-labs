# AerE 361 Lab 3
# Spring 2021
# Professor Nelson
# Ex 2 Test Script
# DO NOT EDIT THIS SCRIPT
FILE="ex2.c"
tput setaf 6
RANDOM=$(date +%s%N | cut -b10-19)
test1=$(( 40 + $RANDOM % (50 - 40 + 1) ))
test2=$(( 18 + $RANDOM % (25 - 18 + 1 ) ))
test3=$(( 26 + $RANDOM % (39 - 26 +1 ) ))
echo "Starting tests with values $test1 $test2 $test3..."
echo
#Array to hold our prefixes
elements=( one two three four five)
#Run our programs and store the results
# Test 1
one_ex_test=$(./ex2 101)
one_ex_test_status=$?
# Test 2
two_ex_test=$(./ex2 $test1)
two_ex_test_status=$?
# Test 3
three_ex_test=$(./ex2 16)
three_ex_test_status=$?
# Test 4
four_ex_test=$(./ex2 $test2)
four_ex_test_status=$?

# Test 5
five_ex_test=$(./ex2 $test3)
five_ex_test_status=$?

# Store the expected output
one_expected_output="You are over 100 years old! You are really old!"
two_expected_output="You are between the age of 40 and 50. You are pretty young!"
three_expected_output="You are under 18. You are pretty young!"
four_expected_output="You are between the age of 18 and 25. You are pretty young!"
five_expected_output="You are between the age of 26 and 39. You are pretty young!"

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
    rm ex2 >/dev/null
    exit 1 
  fi
done
echo "Using numerical values of 101, $test1, 16, $test2, and $test3"
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
    rm ex2 >/dev/null
    exit 1
  fi
done

echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm ex2 >/dev/null
exit 0
