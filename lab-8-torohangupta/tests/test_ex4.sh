# AerE 361 Lab 8
# Spring 2021
# Professor Nelson
# Ex 4 Script
# DO NOT EDIT THIS SCRIPT
export TERM=xterm-256color
FILESRC="broke2.c"
FILEEXE="a.out"

tput setaf 6

echo "Testing Exercise 4"

# Make sure the file compiles
test=$(gcc -Wall $FILESRC 2>&1)
status=$?

test_run=$(./$FILEEXE 5.4365 10)
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
