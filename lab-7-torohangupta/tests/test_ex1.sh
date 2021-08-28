# AerE 361 Lab 7
# Spring 2021
# Professor Nelson
# Ex 1 Script
# DO NOT EDIT THIS SCRIPT
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
echo "Testing Exercise 1"
echo

# Check that they have created the Source files
# Check for Add
if [ -s $FILESRC_ADD ];
	then
		tput setaf 2
  	echo -e "Checking that $FILESRC_ADD is not empty....OK"
    if grep -q "gSummand" $FILESRC_ADD && grep -q "void setSummand" $FILESRC_ADD;
    then
			tput setaf 2
      echo -e "Validating that proper terms is in $FILESRC_ADD....OK"
    else
			tput setaf 1
      echo -e "Validating that proper terms is in $FILESRC_ADD....FAILED"
      exit 1
		fi
else
		tput setaf 1
    echo -e "Checking that $FILESRC_ADD is not empty....FAILED"
    exit 1
fi
# Check for answer
if [ -s $FILESRC_ANSWER ];
	then
		tput setaf 2
  	echo -e "Checking that $FILESRC_ANSWER is not empty....OK"
    if grep -q "setSummand" $FILESRC_ANSWER && grep -q "int answer()" $FILESRC_ANSWER;
    then
			tput setaf 2
      echo -e "Validating that proper terms is in $FILESRC_ANSWER....OK"
    else
			tput setaf 1
      echo -e "Validating that proper terms is in $FILESRC_ANSWER....FAILED"
      exit 1
		fi
else
	tput setaf 1
  echo -e "Checking that $FILESRC_ANSWER is not empty....FAILED"
  exit 1
fi

# Check for Add
if [ -s $FILEH_ADD ];
	then
		tput setaf 2
  	echo -e "Checking that $FILEH_ADD is not empty....OK"
    if grep -q "void setSummand(int summand);" $FILEH_ADD && grep -q "int  add(int summand);" $FILEH_ADD;
    then
			tput setaf 2
      echo -e "Validating that proper terms is in $FILEH_ADD....OK"
    else
			tput setaf 1
      echo -e "Validating that proper terms is in $FILEH_ADD....FAILED"
      exit 1
		fi
else
	tput setaf 1
  echo -e "Checking that $FILEH_ADD is not empty....FAILED"
  exit 1
fi

# Check for answer header
if [ -s $FILEH_ANSWER ];
	then
		tput setaf 2
  	echo -e "Checking that $FILEH_ANSWER is not empty....OK"
    if grep -q "int" $FILEH_ANSWER && grep -q "answer()" $FILEH_ANSWER;
    then
			tput setaf 2
      echo -e "Validating that proper terms is in $FILEH_ANSWER....OK"
    else
			tput setaf 1
      echo -e "Validating that proper terms is in $FILEH_ANSWER....FAILED"
			make clean
      exit 1
		fi
else
	tput setaf 1
  echo -e "Checking that $FILEH_ANSWER is not empty....FAILED"
	make clean
  exit 1
fi

echo
tput setaf 7
echo "All tests passed"
exit 0
