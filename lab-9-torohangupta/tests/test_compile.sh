# AerE 361 Lab 9
# Spring 2021
# Professor Nelson
# Compile test Script
# DO NOT EDIT THIS SCRIPT
export TERM=xterm-256color
FILESRC="src/decode.c"
FILEEXE="convert_fit.out"
LIBDIR="lib"
ODIR="bin"
SRCDIR="src"
CFLAGS="-Iinclude -Wall -std=c11"
decode=""
DEPEND="${ODIR}/decode.o ${ODIR}/fit.o ${ODIR}/fit_convert.o ${ODIR}/fit_crc.o ${ODIR}/fit_ram.o ${ODIR}/fit_example.o"
DEPEND_SRC="${SRCDIR}/decode.c ${SRCDIR}/fit.c ${SRCDIR}/fit_convert.c ${SRCDIR}/fit_crc.c ${SRCDIR}/fit_ram.c ${SRCDIR}/fit_example.c"

tput setaf 6

echo "Testing that the file compiles."
echo "There must be no errors or warnings."

# Make sure the file compiles
test=$(gcc ${CFLAGS} ${DEPEND_SRC} -o ${FILEEXE} 2>&1)
status=$?

if [ ${status} -ne 0 ]; then
	tput setaf 1
  echo "Compiling $FILESRC....FAILED"
	echo "$test"
	echo "$status"
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