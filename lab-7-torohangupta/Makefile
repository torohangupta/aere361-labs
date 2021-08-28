# AER E 361
# Rohan Gupta
# Section 1
# Lab 7 Makefile

IDIR=./include
CC=gcc
CFLAGS=-I$(IDIR) -Wall -std=c11
LIBS=-lm
ODIR=bin
LIBDIR=lib

# You can keep this here, might be handy
all: run_main_static run_main_shared

# main.o
main.o:
	@echo "Making main.o"
	@$(CC) -c $(CFLAGS) main.c -o bin/main.o
	@echo "Done with main.o"

# run_main_static
run_main_static: main_static
	@echo "Running main with Static Libraries"
	@./bin/main_static

# run_main_shared
run_main_shared: main_shared
	@echo "Running main with Shared Libraries"
	@LD_LIBRARY_PATH=$(LIBDIR)/shared bin/main_shared

# main_static
main_static: main.o
	@echo "Making Static libraries for Main ..."
	@$(CC) -c $(CFLAGS) src/add.c -o $(LIBDIR)/static/add.o
	@$(CC) -c $(CFLAGS) src/answer.c -o $(LIBDIR)/static/answer.o
	@$(CC) -c $(CFLAGS) src/csvparser.c -o $(LIBDIR)/static/csvparser.o
	@$(CC) -c $(CFLAGS) src/mycsv.c -o $(LIBDIR)/static/mycsv.o

	@ar rcs $(LIBDIR)/static/libaddans.a $(LIBDIR)/static/add.o $(LIBDIR)/static/answer.o
	@ar rcs $(LIBDIR)/static/libcsvparser.a $(LIBDIR)/static/csvparser.o $(LIBDIR)/static/mycsv.o
	@echo "Done making Static Libraries"

	@echo "Compiling main and linking to static libraries"
	@gcc $(CFLAGS) bin/main.o -L$(LIBDIR)/static -laddans -lcsvparser -o bin/main_static
	@echo "Done compiling main"

# main_shared
main_shared: main.o
#object files for shared libraries need to be compiled as position independent3
#code (-fPIC) because they are mapped to any position in the address space.
	@echo "Making Shares libraries for Main..."
	@gcc -c $(CFLAGS) -fPIC src/add.c -o $(LIBDIR)/shared/add.o
	@gcc -c $(CFLAGS) -fPIC src/answer.c -o $(LIBDIR)/shared/answer.o
	@gcc -c $(CFLAGS) -fPIC src/csvparser.c -o $(LIBDIR)/shared/csvparser.o
	@gcc -c $(CFLAGS) -fPIC src/mycsv.c -o $(LIBDIR)/shared/mycsv.o

	@gcc -shared $(LIBDIR)/shared/add.o $(LIBDIR)/shared/answer.o -o $(LIBDIR)/shared/libaddans.so
	@gcc -shared $(LIBDIR)/shared/csvparser.o $(LIBDIR)/shared/mycsv.o -o $(LIBDIR)/shared/libcsvparser.so

	@echo "Compiling Main to use shared libraries"
	@gcc bin/main.o -L$(LIBDIR)/shared -laddans -lcsvparser -o bin/main_shared
	@echo "Done compiling main."

# This is the clean all option
# Remember to make clean before final submission
clean:
	@echo "Cleaning up all generated files"
	@find . -type f -name '*.o' -delete
	@find . -type f -name '*.a' -delete
	@find . -type f -name '*.so' -delete
	@echo "Cleaning up executable files"
	@rm -f bin/main_static bin/main_shared
	@rm -f output1.csv output2.csv output3.csv output4.csv
	@echo "Done cleaning"

# This just cleans non-essential library files
clean_lib:
	@echo "Cleaning up libraries"
	@find . -type f -name '*.o' -delete
	@find . -type f -name '*.a' -delete
	@echo "Done cleaning up libraries"

# Keep everything here, used by the autograder
test_ex1:
	bash tests/test_ex1.sh

test_ex2:
	bash tests/test_ex2.sh

test_ex3:
	bash tests/test_ex3.sh

test_ex4:
	bash tests/test_ex4.sh

test_ex5:
	bash tests/test_ex5.sh

test_Makefile:
	bash tests/test_Makefile.sh

test_all: main_static main_shared
	bash tests/test_ex1.sh
	bash tests/test_ex2.sh
	bash tests/test_ex3.sh
	bash tests/test_ex4.sh
	bash tests/test_ex5.sh
	bash tests/test_Makefile.sh
