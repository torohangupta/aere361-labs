#/bin/bash
# AerE 361 Lab 3
# Spring 2021
# Professor Nelson
# Exercise 1 Test Script
# DO NOT EDIT THIS SCRIPT
FILE="ex1.c"
tput setaf 6
echo "Starting tests..."
echo
RANDOM=$(date +%s%N | cut -b10-19)
lower=1000
upper=32000
jan=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
feb=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
mar=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
apr=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
may=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
jun=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
jul=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
aug=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
sep=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
oct=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
nov=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
dec=$(( $lower + $RANDOM % ($upper - $lower + 1) ))
rate=4.56

one_units=51
one_cost=21

#Caclulate values
((yearSold=jan+feb+mar+apr+may+jun+jul+aug+sep+oct+nov+dec))
RevYear=`awk "BEGIN {printf \"%.2f\", $yearSold / 150.0 * $rate}"`

#Run our programs and store the results

# Test 1
one_ex_test=$(./ex1 $jan $feb $mar $apr $may $jun $jul $aug $sep $oct $nov $dec $rate)
one_ex_test_status=$?

# Store the expected output
one_expected_output="yearSold: $yearSold  RevYear: $RevYear"

if [ ${one_ex_test_status} -eq 0 ]
then
  tput setaf 2
  echo "Running Program Test 1 ....OK"
else
  tput setaf 1
  echo "Running Program Test 1 ....FAILED"
  tput setaf 7
  echo "Program 1 failed to run, cleaning up files."
  rm ex1 >/dev/null
  exit 1
fi

if [ -s $FILE ];
	then
  	echo -e "Checking that ex1.c is not empty....OK"
    if grep -q "unsigned short" $FILE && grep -q "float" $FILE;
    then
      echo -e "Validating correct type used....OK"
    else
      echo -e "Validating correct type used....FAILED"
      exit 1
		fi
else
    ex3=" No "
    echo -e "Checking that ex1.c is not empty....FAILED"
    exit 1
fi

if [ "${one_ex_test}" == "${one_expected_output}" ] ; then
  tput setaf 2
	echo "Sent values"
	echo "Jan: $jan Feb: $feb Mar: $mar"
	echo "Apr: $apr May: $may Jun: $jun"
	echo "Jul: $jul Aug: $aug Sep: $sep"
	echo "Oct: $oct Nov: $nov Dec: $dec"
	echo "Rate used: $rate"
	echo "Autograder results: $one_expected_output"
  echo "Logic test condition 1....PASS"
else
  tput setaf 1
  echo "Logic test condition 1....FAIL"
	echo "Sent values"
	echo "Jan: $jan Feb: $feb Mar: $mar"
	echo "Apr: $apr May: $may Jun: $jun"
	echo "Jul: $jul Aug: $aug Sep: $sep"
	echo "Oct: $oct Nov: $nov Dec: $dec"
	echo "Rate used: $rate"
	echo "Autograder results: $one_expected_output"
  echo "Fail: Expected $one_expected_output but got: $one_ex_test"
  tput setaf 7
  echo "Cleaning up files..."
  rm ex1 >/dev/null
  exit 1
fi

echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm ex1 >/dev/null
exit 0
