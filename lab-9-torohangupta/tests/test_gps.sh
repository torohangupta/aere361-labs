# AerE 361 Lab 9
# Spring 2021
# Professor Nelson
# Check GPS output Script
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

# Run the program
test_run=$(./${FILEEXE} ${DATA})
run_status=$?
echo "$run_status"
echo "$test_run"

if [ ${run_status} -ne 0 ]; then
	tput setaf 1
  echo "Checking output on $FILEEXE....FAILED"
	echo "Cleaning files"
	make clean
  exit 1
else
  if grep "ERROR" <<<"${test_run}" >/dev/null ; then
		tput setaf 3
    echo "Checking for errors on $FILEEXE....FAILED"
		echo "An error happened during execution."
		echo "Cleaning files"
		make clean
    exit 1
  else
		tput setaf 2
    echo "Running $FILESRC....OK"
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

# Check that they have gps_log.txt
if [ -s $GPS_DATA ];
	then
		tput setaf 2
  	echo -e "Checking that $GPS_DATA is not empty....OK"
    if grep -q "0	 -93.54258673	 42.20033672	 5261.12	 132.70 90.10" $GPS_DATA;
    then
			tput setaf 2
      echo -e "Validating that proper data is in $GPS_DATA....OK"
    else
			tput setaf 1
      echo -e "Validating that proper data is in $GPS_DATA....FAILED"
      exit 1
		fi
else
		tput setaf 1
    echo -e "Checking that $GPS_DATA is not empty....FAILED"
    exit 1
fi

echo
tput setaf 7
echo "All tests passed, cleaning up files"
make clean
exit 0
