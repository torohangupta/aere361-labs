# AerE 361 Lab 5
# Spring 2021
# Matt Kreul
# integration Test Script
# DO NOT EDIT THIS SCRIPT
FILESRC="integration.c"
FILEEXE="integration"
OPS="sin(x)"
tput setaf 6
echo "Starting tests..."
echo

echo "Starting tests with value of $test1 and answer of $answer..."
echo
#Array to hold our prefixes
elements=( one two three )

#Run our programs and store the results

# Test 1
one_ex_test=$(./$FILEEXE 0 2 4)
one_ex_test_status=$?
# Test 2
two_ex_test=$(./$FILEEXE 5.5 2.3 2)
two_ex_test_status=$?

# Test 3
three_ex_test=$(./$FILEEXE -3.14159265 3.14159265 10)
three_ex_test_status=$?

# Store the expected output
one_expected_output="Midpoint integration: 1.68294
Simpson's 1/3 Rule: 1.42506
Simpson's 3/8 Rule: 1.42006
Gauss Quad: 1.41615"
two_expected_output="Midpoint integration: 2.20085
Simpson's 1/3 Rule: 1.44581
Simpson's 3/8 Rule: 1.40533
Gauss Quad: 1.37495"
three_expected_output="Midpoint integration: 0
Simpson's 1/3 Rule: 0
Simpson's 3/8 Rule: 9.61835e-17
Gauss Quad: 0"

if [ -s $FILESRC ];
	then
  	echo -e "Checking that $FILESRC is not empty....OK"
    if grep -q "midpoint" $FILESRC && grep -q "simpson_13" $FILESRC && grep -q "simpson_38" $FILESRC && grep -q "gauss_quad" $FILESRC;
    then
      echo -e "Validating that $FILESRC has correct function headers....OK"
    else
      echo -e "Validating that $FILESRC has function headers....FAILED"
      exit 1
		fi
else
    ex3=" No "
    echo -e "Checking that $FILESRC is not empty....FAILED"
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
