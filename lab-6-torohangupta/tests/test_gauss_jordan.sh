# AerE 361 Lab 6
# Spring 2021
# Professor Nelson
# Ex 4 Test Script
# DO NOT EDIT THIS SCRIPT
FILEEXE="gauss_jordan"
FILESRC="gauss_jordan.c"
TESTINPUT1='2\n5\n7\n-2\n-4\n10\n20\n0\n'
TESTINPUT2='3\n10\n-7\n5\n9\n3\n6\n0\n-9\n9\n3\n-2\n-1\n'
TESTINPUT3="5\n3\n2\n-8\n-5\n-10\n10\n20\n30\n15\n12\n34\n-20\n4\n7\n9\n0\n2\n5\n19\n12\n15\n6\n5\n4\n3\n8\n9\n22\n23\n"
tput setaf 6
echo "Starting tests with 2, 3 and 5 equations..."
echo
#Array to hold our prefixes
elements=( one two three)
#Run our programs and store the results
# Test 1
one_ex_test=$(echo -ne $TESTINPUT1 | ./$FILEEXE )
one_ex_test_status=$?
# Test 2
two_ex_test=$(echo -ne $TESTINPUT2 | ./$FILEEXE)
two_ex_test_status=$?
# Test 3
three_ex_test=$(echo -ne $TESTINPUT3 | ./$FILEEXE)
three_ex_test_status=$?


# Store the expected output
one_expected_output="solution0=-2.051282"
one_expected_outputB="solution1=1.179487"
two_expected_output="solution0=0.224806"
two_expected_outputB="solution1=-1.612403"
three_expected_output="solution0=-0.888830"
three_expected_outputB="solution4=-2.006784"


if [ -s $FILESRC ];
	then
  	echo -e "Checking that $FILESRC is not empty....OK"
    if grep -q "malloc" $FILESRC;
    then
      echo -e "Validating that malloc is in $FILESRC....OK"
    else
      echo -e "Validating that malloc is in $FILESRC....FAILED"
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
for number in ${elements[@]}
do
  current_test=$number\_ex_test
  current_out=$number\_expected_output
	current_outB=$number\_expected_outputB
	if grep -q "${!current_out}" <<< "${!current_test}" && grep -q "${!current_outB}" <<< "${!current_test}"; then
  #if [[ *"${!current_test}"* == *"${!current_out}"* ]] ; then
    tput setaf 2
    echo "Logic test condition $number ....PASS"
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
