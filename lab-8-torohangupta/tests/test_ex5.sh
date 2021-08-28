# AerE 361 Lab 8
# Spring 2021
# Professor Nelson
# Ex 5 Script
# DO NOT EDIT THIS SCRIPT
export TERM=xterm-256color
FILESRC="src/numerical_test.c"
FILEEXE="numerical_test.out"
LIBDIR="lib"
CFLAGS="-Iinclude -Wall -std=c11"

tput setaf 6

echo "Testing Exercise 5"

# Make sure the file compiles
test=$(gcc -Wall ${FILESRC} munit/munit.c -L${LIBDIR} -lnumerical -lm ${CFLAGS} -o ${FILEEXE} 2>&1)
status=$?
#test_compile=$(gcc -Wall ${FILESRC} munit/munit.c -L${LIBDIR} -lnumerical -lm ${CFLAGS} -o ${FILEEXE})
test_run=$(LD_LIBRARY_PATH=${LIBDIR} ./${FILEEXE})
run_status=$?

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
		tput setaf 2
    echo "Compiling $FILESRC....OK"
  fi
fi

if [ ${run_status} -ne 0 ]; then
	tput setaf 1
  echo "Checking Unit Test output on $FILEEXE....FAILED"
	echo "Cleaning files"
	make clean
  exit 1
else
  if grep "ERROR" <<<"${test_run}" >/dev/null ; then
		tput setaf 3
    echo "Running Unit Test on $FILEEXE....FAILED"
		echo "Unit Test reports an Error that needs to be fixed."
		echo "Cleaning files"
		make clean
    exit 1
  else
		tput setaf 2
    echo "Compiling $FILESRC....OK"
  fi
fi

if [ ${run_status} -eq 0 ]
  then
    tput setaf 2
    echo "Running $FILEEXE ....OK"
  else
    tput setaf 1
    echo "Running $FILEEXE ....FAILED"
    tput setaf 7
    echo "Program $FILEEXE failed to run, cleaning up files."
    make clean
    exit 1
  fi



echo
tput setaf 7
echo "All tests passed, cleaning up files"
make clean
exit 0
