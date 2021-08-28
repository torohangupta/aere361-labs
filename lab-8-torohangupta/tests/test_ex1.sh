# AerE 361 Lab 8
# Spring 2021
# Professor Nelson
# Ex 1 Script
# DO NOT EDIT THIS SCRIPT
export TERM=xterm-256color
FILESRC="fac_3.c"

tput setaf 6

echo "Testing Exercise 1"

# Check that they have fac_1.c and fixed it
if [ -s $FILESRC ];
	then
		tput setaf 2
  	echo -e "Checking that $FILESRC is not empty....OK"
    if grep -q "&n" $FILESRC && grep -q "n>0" $FILESRC || grep -q "n > 0" $FILESRC;
    then
			tput setaf 2
      echo -e "Validating that proper terms is in $FILESRC....OK"
    else
			tput setaf 1
      echo -e "Validating that proper terms is in $FILESRC....FAILED"
      exit 1
		fi
else
		tput setaf 1
    echo -e "Checking that $FILESRC is not empty....FAILED"
    exit 1
fi

# Make sure the file compiles
test=$(gcc -Wall $FILESRC 2>&1)
status=$?

if [ ${status} -ne 0 ]; then
	tput setaf 1
  echo "Compiling $FILESRC....FAILED"
	echo "Cleaning files"
	make clean
  exit 1
else
  if grep "warning:" <<<"${test}" >/dev/null ; then
		tput setaf 3
    echo "Compiling $FILESRC....WARNING"
		echo "Compile must not have warnings, failing autograder"
		echo "Cleaning files"
		make clean
    exit 1
  else
    echo "Compiling $FILESRC....OK"
  fi
fi


echo
tput setaf 7
echo "All tests passed, cleaning up files"
make clean
exit 0
