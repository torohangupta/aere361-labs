# AerE 361 Lab 4
# Spring 2021
# Professor Nelson
# Ex 4 Test Script
# DO NOT EDIT THIS SCRIPT
#FILESRC="mac_exp.c"
FILEEXE="exp"
#tput setaf 6
echo "Starting tests..."
echo "$FILE_EXE"
echo "$FILE_SRC"
#Array to hold our prefixes
elements=( one two three )
#Run our programs and store the results
# Test 1
one_ex_test=$(./$FILEEXE 4.5 .1)
one_ex_test_status=$?
# Test 2
two_ex_test=$(./$FILEEXE 4.5 .3)
two_ex_test_status=$?
# Test 3
three_ex_test=$(./$FILEEXE 7.9 .2)
three_ex_test_status=$?
# Store the expected output
one_expected_output="After 13 terms in the series, exp(4.500000) is approx. 89.994484 with an error of 0.049829 "
two_expected_output="After 12 terms in the series, exp(4.500000) is approx. 89.944655 with an error of 0.143951 "
three_expected_output="After 21 terms in the series, exp(7.900000) is approx. 2697.207288 with an error of 0.138620 "
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
    rm $FILEEXE >/dev/null
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
    rm $FILEEXE >/dev/null
    exit 1
  fi
done
echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm $FILEEXE >/dev/null
exit 0
