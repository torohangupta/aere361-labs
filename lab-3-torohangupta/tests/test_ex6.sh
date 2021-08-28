# AerE 361 Lab 3
# Spring 2021
# Professor Nelson
# Ex 6 Test Script
# DO NOT EDIT THIS SCRIPT
FILE="ex6"
tput setaf 6
echo "Starting tests..."
echo
RANDOM=$(date +%s%N | cut -b10-19)
test1=$(( 1 + $RANDOM % (50 - 1 + 1) ))
answer=$(( $test1*($test1+1)/2 ))
echo "Starting tests with value of $test1 and answer of $answer..."
echo
#Array to hold our prefixes
elements=( one two )

#Run our programs and store the results

# Test 1
one_ex_test=$(./$FILE $test1)
one_ex_test_status=$?
# Test 2
two_ex_test=$(./$FILE 10.15)
two_ex_test_status=$?

# Store the expected output
one_expected_output="Using a gauss adder, the answer is: $answer."
two_expected_output="That is not an integer."

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
    rm $FILE >/dev/null
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
    rm $FILE >/dev/null
    exit 1
  fi
done

echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm $FILE >/dev/null
exit 0
