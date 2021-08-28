# AerE 361 Lab 8
# Spring 2021
# Professor Nelson
# Ex 2 Script
# DO NOT EDIT THIS SCRIPT
export TERM=xterm-256color
FILESRC="val_test.c"

tput setaf 6
echo "Testing Exercise 2"

# Make sure the file compiles
test_gcc=$(gcc -Wall -g $FILESRC 2>&1)
status_gcc=$?

# Make sure the file passes Valgrind
test_valgrind=$(valgrind --leak-check=yes ./a.out 2>&1)
status_valgrind=$?


if [ ${status_gcc} -ne 0 ]; then
	tput setaf 1
  echo "Compiling $FILESRC....FAILED"
	echo "Cleaning files"
	make clean
  exit 1
else
  if grep "warning:" <<<"${test_gcc}" >/dev/null ; then
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

if [ ${status_valgrind} -ne 0 ]; then
	tput setaf 1
  echo "Running Valgrind on $FILESRC....FAILED"
	echo "Cleaning files"
	make clean
  exit 1
else
  if grep "definitely lost" <<<"${test_valgrind}" >/dev/null; then
		tput setaf 3
    echo "Valgrind found a memory leak, please fix"
		echo "Need to fix leak to pass autograder"
		echo "Cleaning files"
		make clean
    exit 1
  else
		if grep "Invalid write of size" <<<"${test_valgrind}" >/dev/null; then
		tput setaf 3
    echo "Valgrind found heap block over run, please fix"
		echo "Need to fix the overrun to pass autograder"
		echo "Cleaning files"
		make clean
    exit 1
  else
    echo "Valgrind check on $FILESRC....OK"
		fi
  fi
fi

echo
tput setaf 7
echo "All tests passed, cleaning up files"
make clean
exit 0


