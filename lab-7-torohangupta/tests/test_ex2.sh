# AerE 361 Lab 7
# Spring 2021
# Professor Nelson
# Ex 2 Script
# DO NOT EDIT THIS SCRIPT
# This fixes tput issues on GH Actions
export TERM=xterm-256color
MAKEFILE="Makefile"
FILEEXE="main"
FILESRC_ADD="src/add.c"
FILESRC_ANSWER="src/answer.c"
FILESRC_CSVPARSE="src/csvparser.c"
FILEH_ADD="include/add.h"
FILEH_ANSWER="include/answer.h"
FILEH_CSVPARSE="include/csvparser.h"
FILEOBJ_MAIN="bin/main.o"
FILEOBJ_ADD_SHARED="lib/shared/add.o"
FILEOBJ_ANSWER_SHARED="lib/shared/answer.o"
FILEOBJ_CSVPARSE_SHARED="lib/shared/csvparser.o"
FILEOBJ_ADD_STATIC="lib/static/add.o"
FILEOBJ_ANSWER_STATIC="lib/static/answer.o"
FILEOBJ_CSVPARSE_STATIC="lib/static/csvparser.o"
FILESO_ADD="lib/shared/libaddans.so"
FILESO_CSVPARSE="lib/shared/libcsvparser.so"
FILEA_ADD="lib/static/libaddans.a"
FILEA_CSVPARSE="lib/static/libcsvparser.a"

tput setaf 6
echo "Testing Exercise 2"
echo

# Run Makefile to build static version
static_test=$(make main_static)
static_test_status=$?

if [ ${static_test_status} -eq 0 ]
  then
    tput setaf 2
    echo "Running make main_static Execution Test....OK"
  else
    tput setaf 1
    echo "Running make main_static Execution Test....FAILED"
    tput setaf 7
    echo "Running make main_static failed to run, cleaning up files."
    make clean_all
    exit 1
fi

# Test that proper files were generated
if [ -s $FILEOBJ_ADD_STATIC ];
	then
		tput setaf 2
  	echo -e "Checking that $FILEOBJ_ADD_STATIC is not empty....OK"    
else
		tput setaf 1
    echo -e "Checking that $FILEOBJ_ADD_STATIC is not empty....FAILED"
		make clean_all
    exit 1
fi

if [ -s $FILEOBJ_ANSWER_STATIC ];
	then
		tput setaf 2
  	echo -e "Checking that $FILEOBJ_ANSWER_STATIC is not empty....OK"
    
else
		tput setaf 1
    echo -e "Checking that $FILEOBJ_ANSWER_STATIC is not empty....FAILED"
		make clean
    exit 1
fi

if [ -s $FILEA_ADD ];
	then
		tput setaf 2
  	echo -e "Checking that $FILEA_ADD is not empty....OK"
    
else
		tput setaf 1
    echo -e "Checking that $FILEA_ADD is not empty....FAILED"
		make clean
    exit 1
fi

# Run Makefile to run static version
static_test=$(make run_main_static)
static_test_status=$?

if [ ${static_test_status} -eq 0 ]
  then
    tput setaf 2
    echo "Running static version of main Execution Test....OK"
  else
    tput setaf 1
    echo "Running static version of main Execution Test....FAILED"
    tput setaf 7
    echo "Running static version of main failed to run, cleaning up files."
    make clean
    exit 1
fi

echo
tput setaf 7
echo "All tests passed, cleaning up files."
make clean
exit 0
