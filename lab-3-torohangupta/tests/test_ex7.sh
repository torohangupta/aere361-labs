# AerE 361 Lab 3
# Spring 2021
# Professor Nelson
# Ex 7 Test Script
# DO NOT EDIT THIS SCRIPT
FILE="ex7"
tput setaf 6
echo "Starting tests..."
echo
RANDOM=$(date +%s%N | cut -b10-19)
test1=$(( 1 + $RANDOM % (50 - 1 + 1) ))
test2=$(( 1000000 + $RANDOM % (10000000 - 1 + 1) ))
answer=$(( $test1*($test1+1)/2 ))
answer2=$(( $test2*($test2+1)/2 ))
echo "Starting tests with value of $test1 and answer of $answer..."
echo "Starting tests with value of $test2 and answer of $answer2..."
echo
#Array to hold our prefixes
elements=( one two three four five)

#Run our programs and store the results

# Test 1
one_ex_test=$(./$FILE $test1 1)
one_ex_test_status=$?
# Test 2
two_ex_test=$(./$FILE $test1 2)
two_ex_test_status=$?

# Test 3
three_ex_test=$(./$FILE 10.15 1)
three_ex_test_status=$?

# Test 4
four_ex_test=$(./$FILE $test2 1)
four_ex_test_status=$?
# Test 5
five_ex_test=$(./$FILE $test2 2)
five_ex_test_status=$?

# Store the expected output
one_expected_output="Using a brute force adder, the answer is: $answer."
two_expected_output="Using a gauss adder, the answer is: $answer."
three_expected_output="That is not an integer."
four_expected_output="Using a brute force adder, the answer is: $answer2."
five_expected_output="Using a gauss adder, the answer is: $answer2."

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
