# AerE 361 Lab 9
# Spring 2021
# Professor Nelson
# Check Makefile Script
# DO NOT EDIT THIS SCRIPT
export TERM=xterm-256color
FILESRC="src/decode.c"
FILEEXE="convert_fit.out"
DATA="data/aere361_data.fit"
GPS_DATA="gps_log.txt"
ATT_DATA="attitude_log.txt"
LIBDIR="lib"
ODIR="bin"
SRCDIR="src"

tput setaf 6

# Run that make compiles the program
test_run1=$(make all)
run_status1=$?
echo "$run_status1"
echo "$test_run1"

# Run that make runs the program
test_run2=$(make run)
run_status2=$?
echo "$run_status2"
echo "$test_run2"

# Run that make graphs the data
test_run3=$(make graph)
run_status3=$?
echo "$run_status3"
echo "$test_run3"


if [ ${run_status1} -eq 0 ]
  then
    tput setaf 2
    echo "Running make all ....OK"
  else
    tput setaf 1
    echo "Running make all ....FAILED"
    tput setaf 7
    echo "Program make all failed to run, cleaning up files."
    make clean
    exit 1
  fi

if [ ${run_status2} -eq 0 ]
  then
    tput setaf 2
    echo "Running make run ....OK"
		make clean
  else
    tput setaf 1
    echo "Running make run ....FAILED"
    tput setaf 7
    echo "Program make run failed to run, cleaning up files."
		make clean
    exit 1
  fi

if [ ${run_status3} -eq 0 ]
  then
    tput setaf 2
    echo "Running make graph ....OK"
  else
    tput setaf 1
    echo "Running make graph ....FAILED"
    tput setaf 7
    echo "Program make graph failed to run, cleaning up files."
    make clean
    exit 1
  fi

echo
tput setaf 7
echo "All tests passed, cleaning up files"
make clean
exit 0
