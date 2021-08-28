# AerE 361 Lab 3
# Spring 2021
# Professor Nelson
# Exercise 3 Test Script
# DO NOT EDIT THIS SCRIPT
FILE="ex3"
tput setaf 6
RANDOM=$(date +%s%N | cut -b10-19)
echo "Starting tests..."
echo
# Unit price $20 and over
one_units=$(( 51 + $RANDOM % (150 - 51 + 1) ))
one_cost=$(( 20 + $RANDOM % (50 - 20 + 1) ))
# Between 21 and 50 units
two_units=$(( 21 + $RANDOM % (49 - 21 + 1) ))
two_cost=$(( 20 + $RANDOM % (50 - 20 + 1) ))
# Between 11 and 20 units
three_units=$(( 11 + $RANDOM % (20 - 11 + 1) ))
three_cost=$(( 20 + $RANDOM % (50 - 20 + 1) ))
# Between 1 and 10 units
four_units=$(( 1 + $RANDOM % (10 - 1 + 1) ))
four_cost=$(( 20 + $RANDOM % (50 - 20 + 1) ))
# Unit price under $20
five_units=$(( 51 + $RANDOM % (150 - 51 + 1) ))
five_cost=$(( 1 + $RANDOM % (19 - 1 + 1) ))
# Between 21 and 50 units
six_units=$(( 21 + $RANDOM % (49 - 21 + 1) ))
six_cost=$(( 1 + $RANDOM % (19 - 1 + 1) ))
# Between 11 and 20 units
seven_units=$(( 11 + $RANDOM % (20 - 11 + 1) ))
seven_cost=$(( 1 + $RANDOM % (19 - 1 + 1) ))
# Between 1 and 10 units
eight_units=$(( 1 + $RANDOM % (10 - 1 + 1) ))
eight_cost=$(( 1 + $RANDOM % (19 - 1 + 1) ))

# Calculate answers
one_total=`awk "BEGIN {printf \"%.2f\", $one_units*$one_cost*(1.0-.2)}"`
two_total=`awk "BEGIN {printf \"%.2f\", $two_units*$two_cost*(1.0-.15)}"`
three_total=`awk "BEGIN {printf \"%.2f\", $three_units*$three_cost*(1.0-.1)}"`
four_total=`awk "BEGIN {printf \"%.2f\", $four_units*$four_cost}"`
five_total=`awk "BEGIN {printf \"%.2f\", $five_units*$five_cost*(1.0-.15)}"`
six_total=`awk "BEGIN {printf \"%.2f\", $six_units*$six_cost*(1.0-.1)}"`
seven_total=`awk "BEGIN {printf \"%.2f\", $seven_units*$seven_cost*(1.0-.05)}"`
eight_total=`awk "BEGIN {printf \"%.2f\", $eight_units*$eight_cost}"`

#Array to hold our prefixes
elements=( one two three four five six seven eight)

#Run our programs and store the results

# Test 1
one_ex_test=$(./$FILE $one_cost $one_units)
one_ex_test_status=$?
# Test 2
two_ex_test=$(./$FILE $two_cost $two_units)
two_ex_test_status=$?
# Test 3
three_ex_test=$(./$FILE $three_cost $three_units)
three_ex_test_status=$?
# Test 4
four_ex_test=$(./$FILE $four_cost $four_units)
four_ex_test_status=$?

# Test 5
five_ex_test=$(./$FILE $five_cost $five_units)
five_ex_test_status=$?

# Test 6
six_ex_test=$(./$FILE $six_cost $six_units)
six_ex_test_status=$?

# Test 7
seven_ex_test=$(./$FILE $seven_cost $seven_units)
seven_ex_test_status=$?

# Test 8
eight_ex_test=$(./$FILE $eight_cost $eight_units)
eight_ex_test_status=$?

# Store the expected output
one_expected_output="You received a 20% discount, and the price for $one_units units at \$$one_cost per unit is \$$one_total."
two_expected_output="You received a 15% discount, and the price for $two_units units at \$$two_cost per unit is \$$two_total."
three_expected_output="You received a 10% discount, and the price for $three_units units at \$$three_cost per unit is \$$three_total."
four_expected_output="You received a 0% discount, and the price for $four_units units at \$$four_cost per unit is \$$four_total."
five_expected_output="You received a 15% discount, and the price for $five_units units at \$$five_cost per unit is \$$five_total."
six_expected_output="You received a 10% discount, and the price for $six_units units at \$$six_cost per unit is \$$six_total."
seven_expected_output="You received a 5% discount, and the price for $seven_units units at \$$seven_cost per unit is \$$seven_total."
eight_expected_output="You received a 0% discount, and the price for $eight_units units at \$$eight_cost per unit is \$$eight_total."

for number in ${elements[@]}
do
  current_status=$number\_ex_test_status

  if [ ${!current_status} -eq 0 ]
  then
    tput setaf 2
    echo "Running Program Test $number ....OK"
  else
    tput setaf 1
    echo "Running Program Test $number ....FAILED"
    tput setaf 7
    echo "Program $number failed to run, cleaning up files."
    rm $FILE >/dev/null
    exit 1
  fi
done

for number in ${elements[@]}
do
  current_test=$number\_ex_test
  current_out=$number\_expected_output
	current_unit=$number\_units
	current_cost=$number\_cost
	current_total=$number\_total
  if [ "${!current_test}" == "${!current_out}" ] ; then
    tput setaf 2
		echo "Units: ${!current_unit}, Cost: ${!current_cost}, Total: ${!current_total}"
    echo "Logic test condition $number....PASS"
  else
    tput setaf 1
    echo "Logic test condition $number....FAIL"
		echo "Units: ${!current_unit}, Cost: ${!current_cost}, Total: ${!current_total}"
    echo "Fail: Expected ${!current_out} but got: ${!current_test}"
    tput setaf 7
    echo "Cleaning up files..."
    rm $FILE >/dev/null
    exit 1
  fi
done

echo
tput setaf 7
echo "All tests passed, cleaning up files."
rm $FILE >/dev/null
exit 0
