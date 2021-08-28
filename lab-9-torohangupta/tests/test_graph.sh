# AerE 361 Lab 9
# Spring 2021
# Professor Nelson
# Check graph output Script
# DO NOT EDIT THIS SCRIPT
export TERM=xterm-256color
FILESRC="src/decode.c"
FILEEXE="convert_fit.out"
DATA="data/aere361_data.fit"
GPS_DATA="gps_log.txt"
ATT_DATA="attitude_log.txt"
GRAPH1="3dplot.svg"
GRAPH2="attitude.svg"
GRAPH3="groundspeed_altitude.svg"
GRAPH4="heading_arrows.svg"
GRAPH5="mapped_flight_zoom.svg"
GRAPH6="mapped_flight.svg"

tput setaf 6

# Run that make compiles the program
test_run=$(make graph)
run_status=$?
echo "$run_status3"
echo "$test_run3"


if [ ${run_status} -eq 0 ]
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

# Check that they have the graphs at least
if [ -s $GRAPH1 ];
	then
		tput setaf 2
  	echo -e "Checking that $GRAPH1 is not empty....OK"
else
		tput setaf 1
    echo -e "Checking that $GRAPH1 is not empty....FAILED"
    exit 1
fi

# Check that they have the graphs at least
if [ -s $GRAPH2 ];
	then
		tput setaf 2
  	echo -e "Checking that $GRAPH2 is not empty....OK"
else
		tput setaf 1
    echo -e "Checking that $GRAPH2 is not empty....FAILED"
    exit 1
fi

# Check that they have the graphs at least
if [ -s $GRAPH3 ];
	then
		tput setaf 2
  	echo -e "Checking that $GRAPH3 is not empty....OK"
else
		tput setaf 1
    echo -e "Checking that $GRAPH3 is not empty....FAILED"
    exit 1
fi

# Check that they have the graphs at least
if [ -s $GRAPH4 ];
	then
		tput setaf 2
  	echo -e "Checking that $GRAPH4 is not empty....OK"
else
		tput setaf 1
    echo -e "Checking that $GRAPH4 is not empty....FAILED"
    exit 1
fi

# Check that they have the graphs at least
if [ -s $GRAPH5 ];
	then
		tput setaf 2
  	echo -e "Checking that $GRAPH5 is not empty....OK"
else
		tput setaf 1
    echo -e "Checking that $GRAPH5 is not empty....FAILED"
    exit 1
fi

# Check that they have the graphs at least
if [ -s $GRAPH6 ];
	then
		tput setaf 2
  	echo -e "Checking that $GRAPH6 is not empty....OK"
else
		tput setaf 1
    echo -e "Checking that $GRAPH6 is not empty....FAILED"
    exit 1
fi

echo
tput setaf 7
echo "All tests passed, cleaning up files"
make clean
exit 0
