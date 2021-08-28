# AerE 361 Lab 6
# Spring 2021
# Professor Nelson
# Shell Test Script
# DO NOT EDIT THIS SCRIPT
FILEEXE="shell"
FILESRC="shell.c"
FILEOUT="ans.out"
FILEOUT1="tests/ans_mat1.out"
FILEOUT2="tests/ans_mat2.out"
FILEOUT3="tests/ans_mat3.out"
tput setaf 6
echo "Starting tests with 5, 50 and 99..."
echo


if [ -s $FILESRC ];
	then
  	echo -e "Checking that $FILESRC is not empty....OK"
    if grep -q "malloc" $FILESRC && grep -q "free" $FILESRC;
    then
      echo -e "Validating that malloc and free is in $FILESRC....OK"
    else
      echo -e "Validating that malloc and free is in $FILESRC....FAILED"
      exit 1
		fi
else
    echo -e "Checking that $FILESRC is not empty....FAILED"
    exit 1
fi

# Test 1
one_ex_test=$(echo -ne '5\n' | ./$FILEEXE )
one_ex_test_status=$?

if [ ${one_ex_test_status} -eq 0 ]
  then
    tput setaf 2
    echo "Program $FILEEXE Execution Test 1....OK"
  else
    tput setaf 1
    echo "Program $FILEEXE Execution Test 1....FAILED"
    tput setaf 7
    echo "Program $FILEEXE failed to run, cleaning up files."
    rm $FILEEXE >/dev/null
    exit 1
fi

if cmp -s "$FILEOUT" "$FILEOUT1"; then
	tput setaf 2
	echo "Test 1"
	echo "Checking output to answer file...OK"
  echo "The file $FILEOUT is the same as $FILEOUT1."
else
	tput setaf 1
	echo "Checking output to answer file...FAILED"
	echo "The file $FILEOUT is different from $FILEOUT1."
	exit 1
fi

echo "Cleaning up answer file for next test."
rm $FILEOUT > /dev/null

# Test 2
one_ex_test=$(echo -ne '50\n' | ./$FILEEXE )
one_ex_test_status=$?

if [ ${one_ex_test_status} -eq 0 ]
  then
    tput setaf 2
    echo "Program $FILEEXE Execution Test 2....OK"
  else
    tput setaf 1
    echo "Program $FILEEXE Execution Test 2....FAILED"
    tput setaf 7
    echo "Program $FILEEXE failed to run, cleaning up files."
    rm $FILEEXE >/dev/null
    exit 1
fi

if cmp -s "$FILEOUT" "$FILEOUT2"; then
	tput setaf 2
	echo "Test 2"
	echo "Checking output to answer file...OK"
  echo "The file $FILEOUT is the same as $FILEOUT2."
else
	tput setaf 1
	echo "Checking output to answer file...FAILED"
	echo "The file $FILEOUT is different from $FILEOUT2."
	exit 1
fi

echo "Cleaning up answer file for next test."
rm $FILEOUT > /dev/null

# Test 3
one_ex_test=$(echo -ne '99\n' | ./$FILEEXE )
one_ex_test_status=$?

if [ ${one_ex_test_status} -eq 0 ]
  then
    tput setaf 2
    echo "Program $FILEEXE Execution Test 3....OK"
  else
    tput setaf 1
    echo "Program $FILEEXE Execution Test 3....FAILED"
    tput setaf 7
    echo "Program $FILEEXE failed to run, cleaning up files."
    rm $FILEEXE >/dev/null
    exit 1
fi

if cmp -s "$FILEOUT" "$FILEOUT3"; then
	tput setaf 2
	echo "Test 3"
	echo "Checking output to answer file...OK"
  echo "The file $FILEOUT is the same as $FILEOUT3."
else
	tput setaf 1
	echo "Checking output to answer file...FAILED"
	echo "The file $FILEOUT is different from $FILEOUT3."
	exit 1
fi


echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm $FILEEXE >/dev/null
exit 0
