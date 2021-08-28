# AerE 361 Lab 7
# Spring 2021
# Professor Nelson
# Test makefile and outputs Script
# DO NOT EDIT THIS SCRIPT
# This fixes tput issues on GH Actions
export TERM=xterm-256color
MAKEFILE="Makefile"
FILEEXE="main"
FILESRC_ADD="src/add.c"
FILESRC_ANSWER="src/answer.c"
FILESRC_CSVPARSE="src/csvparser.c"
FILESRC_MYCSV="src/mycsv.c"
FILEH_ADD="include/add.h"
FILEH_ANSWER="include/answer.h"
FILEH_CSVPARSE="include/csvparser.h"
FILEH_MYCSV="include/mycsv.h"
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
one_FILEOUTPUT="output1.csv"
two_FILEOUTPUT="output2.csv"
three_FILEOUTPUT="output3.csv"
four_FILEOUTPUT="output4.csv"
one_SEARCH="9,18,27,36,45"
two_SEARCH="Argentina,South[[:space:]]America,Spainish"
three_SEARCH="59605,-93.38237872,42.09416969,5257.18,129.90,88.26"
four_SEARCH="12668,8.12,6.64,-6.94"

tput setaf 6
echo "Testing Makefile and outputs generated."
echo

#Array to hold our prefixes
elements=( one two three four)
#Run our programs and store the results
# Test make main_static
one_name="Static Library"
one_ex_test=$(make main_static )
one_ex_test_status=$? 
# Test make main_shared
two_name="Shared Library"
two_ex_test=$(make main_shared)
two_ex_test_status=$?
# Test make all
three_name="Make All"
three_ex_test=$(make all)
three_ex_test_status=$?
# Test make all
four_name="Make main.o"
four_ex_test=$(make main.o)
four_ex_test_status=$?

# Check that they have created the Source files
# Check for Add
if [ -s $FILESRC_MYCSV ];
	then
		tput setaf 2
  	echo -e "Checking that $FILESRC_MYCSV is not empty....OK"
    if grep -q "CsvRow" $FILESRC_MYCSV && grep -q "CsvParser" $FILESRC_MYCSV;
    then
			tput setaf 2
      echo -e "Validating that proper terms is in $FILESRC_MYCSV....OK"
    else
			tput setaf 1
      echo -e "Validating that proper terms is in $FILESRC_MYCSV....FAILED"
      exit 1
		fi
else
		tput setaf 1
    echo -e "Checking that $FILESRC_MYCSV is not empty....FAILED"
    exit 1
fi
# Check for answer
if [ -s $FILEH_MYCSV ];
	then
		tput setaf 2
  	echo -e "Checking that $FILEH_MYCSV is not empty....OK"
    if grep -q "mycsv" $FILEH_MYCSV && grep -q "bool" $FILEH_MYCSV;
    then
			tput setaf 2
      echo -e "Validating that proper terms is in $FILEH_MYCSV....OK"
    else
			tput setaf 1
      echo -e "Validating that proper terms is in $FILEH_MYCSV....FAILED"
      exit 1
		fi
else
	tput setaf 1
  echo -e "Checking that $FILEH_MYCSV is not empty....FAILED"
  exit 1
fi

for number in ${elements[@]}
do
	current_name=$number\_name
	shared_test_status=$number\_ex_test_status

	if [ ${!shared_test_status} -eq 0 ]
  	then
    	tput setaf 2
    	echo "Running ${!current_name} Execution Test....OK"
  	else
    	tput setaf 1
    	echo "Running ${!current_name} Execution Test....FAILED"
    	tput setaf 7
    	echo "Running ${!current_name} failed to run, cleaning up files."
    	make clean
    exit 1
	fi
done


for number in ${elements[@]}
do
  current_search=$number\_SEARCH
	current_file=$number\_FILEOUTPUT
  
  if [ -s ${!current_file} ];
	then
		tput setaf 2
  	echo -e "Checking that ${!current_file} is not empty....OK"
    if grep -E -q ${!current_search} ${!current_file};
    then
			tput setaf 2
      echo -e "Validating that ${!current_search} is in ${!current_file}....OK"
    else
			tput setaf 1
      echo -e "Validating that ${!current_search} is in ${!current_file}....FAILED"
			make clean
      exit 1
		fi
	else
		tput setaf 1
    echo -e "Checking that ${!current_file} is not empty....FAILED"
		make clean
    exit 1
	fi
done


echo
tput setaf 7
echo "All tests passed, cleaning up files."
make clean
exit 0