# AerE 361 Lab 4
# Spring 2021
# Professor Nelson
# Ex 5 Test Script
# DO NOT EDIT THIS SCRIPT
FILE_EXE="361_calc"
FILE_SRC="361_calc.c"
tput setaf 6
echo "Starting tests..."
echo
RANDOM=$(date +%s%N | cut -b10-19)
test1=$(( 1 + $RANDOM % (50 - 1 + 1) ))
test2=$(( 1000000 + $RANDOM % (10000000 - 1 + 1) ))
test3=$(( 1 + $RANDOM % (10 - 1 + 1) ))
answer=$(( $test1*($test1+1)/2 ))
answer2=$(( $test2*($test2+1)/2 ))

factorial=1
 
counter=$test3
 
while [[ $counter -gt 0 ]]; do
   factorial=$(( $factorial * $counter ))
   counter=$(( $counter - 1 ))
done

echo "Starting tests with value of $test1 and answer of $answer..."
echo "Starting tests with value of $test2 and answer of $answer2..."
echo "Starting tests with value of $test3 and answer of $factorial..."
echo
#Array to hold our prefixes
elements=( one two three four)

#Run our programs and store the results

# Brute Test
one_ex_test=$(./$FILE_EXE 1 $test1)
one_ex_test_status=$?
# Gauss Test
two_ex_test=$(./$FILE_EXE 2 $test2)
two_ex_test_status=$?

# Factorial Test
three_ex_test=$(./$FILE_EXE 3 $test3)
three_ex_test_status=$?

# Series Value Test
four_ex_test=$(./$FILE_EXE 4 5 5.5)
four_ex_test_status=$?
# Test 2
#five_ex_test=$(./$FILE-EXE $test2 2)
#five_ex_test_status=$?

# Store the expected output
one_expected_output="Using a brute force adder, the answer is: $answer."
two_expected_output="Using a Gauss adder, the answer is: $answer2."
three_expected_output="The factorial of $test3 is $factorial."
four_expected_output="The Series Value of 5 and 5.50 is 14.9417."
#five_expected_output="Using a gauss adder, the answer is: $answer2."

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
    rm $FILE_EXE >/dev/null
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
    rm $FILE_EXE >/dev/null
    exit 1
  fi
done

echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm $FILE_EXE >/dev/null
exit 0
