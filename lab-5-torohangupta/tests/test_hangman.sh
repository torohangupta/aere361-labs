# AerE 361 Lab 3
# Spring 2021
# Professor Nelson
# Ex 2 Test Script
# DO NOT EDIT THIS SCRIPT
FILEEXE="hangman"
FILESRC="hangman.c"
tput setaf 6
echo "Starting tests with test, aero and shuttle..."
echo
#Array to hold our prefixes
elements=( one two three)
#Run our programs and store the results
# Test 1
one_ex_test=$(echo -ne 'test\nt\ne\ns\n' | ./$FILEEXE )
one_ex_test_status=$?
# Test 2
two_ex_test=$(echo -ne 'aero\na\ne\nr\no\n' | ./$FILEEXE)
two_ex_test_status=$?
# Test 3
three_ex_test=$(echo -ne 'shuttle\ns\nh\nu\nt\nl\ne\n' | ./$FILEEXE)
three_ex_test_status=$?

# Store the expected output
one_expected_output="Enter word to guess: The word is : ****
Letter? The word is : t**t
Letter? The word is : te*t
Letter? Victory! The word is test!"
two_expected_output="Enter word to guess: The word is : ****
Letter? The word is : a***
Letter? The word is : ae**
Letter? The word is : aer*
Letter? Victory! The word is aero!"
three_expected_output="Enter word to guess: The word is : *******
Letter? The word is : s******
Letter? The word is : sh*****
Letter? The word is : shu****
Letter? The word is : shutt**
Letter? The word is : shuttl*
Letter? Victory! The word is shuttle!"

if [ -s $FILESRC ];
	then
  	echo -e "Checking that $FILESRC is not empty....OK"
    if grep -q "mask" $FILESRC;
    then
      echo -e "Validating that mask is in $FILESRC....OK"
    else
      echo -e "Validating that mask is in $FILESRC....FAILED"
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
  if [ "${!current_test}" == "${!current_out}" ] ; then
    tput setaf 2
    echo "Output test Number $number....PASS"
  else
    tput setaf 1
    echo "Output test Number $number....FAIL"
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
