# AerE 361 Lab 6
# Spring 2021
# Professor Nelson
# PIV Test Script
# DO NOT EDIT THIS SCRIPT
FILEEXE="piv_vort"
FILESRC="piv_vort.c"
FILEOUT="ans.out"
FILEIN="PIV.dat"
FILEOUT1="Xvel.txt"
FILEOUT2="Yvel.txt"
FILEOUT3="Vort.txt"
SOLFILEOUT1="tests/Xvel.txt"
SOLFILEOUT2="tests/Yvel.txt"
SOLFILEOUT3="tests/Vort.txt"
tput setaf 6
echo "Running tests for velocity components on $FILEEXE..."
echo


if [ -s $FILESRC ];
	then
  	echo -e "Checking that $FILESRC is not empty....OK"
    if grep -q "fopen" $FILESRC && grep -q "fclose" $FILESRC;
    then
      echo -e "Validating that files are handled correctly in $FILESRC....OK"
    else
      echo -e "Validating that files are handled correctly in $FILESRC....FAILED"
      exit 1
		fi
else
    echo -e "Checking that $FILESRC is not empty....FAILED"
    exit 1
fi

# Run program
one_ex_test=$(./$FILEEXE $FILEIN)
one_ex_test_status=$?

if [ ${one_ex_test_status} -eq 0 ]
  then
    tput setaf 2
    echo "Program $FILEEXE Execution Test....OK"
  else
    tput setaf 1
    echo "Program $FILEEXE Execution Test....FAILED"
    tput setaf 7
    echo "Program $FILEEXE failed to run, cleaning up files."
    rm $FILEEXE >/dev/null
    exit 1
fi

if cmp -s "$SOLFILEOUT1" "$FILEOUT1"; then
	tput setaf 2
	echo "Test 1"
	echo "Checking $FILEOUT1 to answer file...OK"
  echo "The file $FILEOUT1 is the same as $SOLFILEOUT1."
else
	tput setaf 1
	echo "Checking $FILEOUT1 to answer file...FAILED"
	echo "The file $FILEOUT1 is different from $SOLFILEOUT1."
	rm $FILEEXE >/dev/null
	exit 1
fi

if cmp -s "$SOLFILEOUT2" "$FILEOUT2"; then
	tput setaf 2
	echo "Test 2"
	echo "Checking $FILEOUT2 to answer file...OK"
  echo "The file $FILEOUT2 is the same as $SOLFILEOUT2."
else
	tput setaf 1
	echo "Checking $FILEOUT2 to answer file...FAILED"
	echo "The file $FILEOUT2 is different from $SOLFILEOUT2."
	rm $FILEEXE >/dev/null
	exit 1
fi


echo
tput setaf 7
echo "All tests passed, cleaning up files."
# rm $FILEEXE >/dev/null
exit 0
