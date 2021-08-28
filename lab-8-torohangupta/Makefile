# AerE 361
# Lab 8 Makefile
# YOUR NAME HERE
# export LD_LIBRARY_PATH=$(pwd)/bin/shared:${LD_LIBRARY_PATH}
IDIR=./include
CC=gcc
LIBS=-lm
CFLAGS=-I$(IDIR) -Wall -std=c11
DEBUG=-DDEBUG
ODIR=bin
SRC=src
LIBDIR=lib
FILESRC:=numerical_test.c
FILEEXE:=numerical_test.out

run_numerical_test:
# compile shared libraries
	@echo "Making numerical_test.o"
	@$(CC) -c $(CFLAGS) src/numerical_test.c -o bin/numerical_test.o
	@$(CC) -c $(CFLAGS) munit/munit.c -o bin/munit.o
	@echo "Done with numerical_test.o"

# compile other more different things
	@echo "Compiling to use shared libraries"
	@gcc bin/numerical_test.o bin/munit.o -L$(LIBDIR)/shared -lnumerical -lm -o bin/numerical_test
	@echo "Done compiling."

	@echo "Running main with Shared Libraries"
	@LD_LIBRARY_PATH=$(LIBDIR) bin/numerical_test


clean:
	@echo "Cleaning up all generated files"
	@find . -type f -name '*.o' -delete
	@echo "Cleaning up executable files"
	@find . -type f -name '*.out' -delete
	@echo "Done cleaning"

test_ex1:
	bash tests/test_ex1.sh

test_ex2:
	bash tests/test_ex2.sh

test_ex4:
	bash tests/test_ex4.sh

test_ex5:
	bash tests/test_ex5.sh

test_all:
	bash tests/test_ex1.sh
	bash tests/test_ex2.sh
	bash tests/test_ex4.sh
	bash tests/test_ex5.sh
