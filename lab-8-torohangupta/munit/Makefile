# Using µnit is very simple; just include the header and add the C
# file to your sources.  That said, here is a simple Makefile to build
# the example.
CC:=gcc
FILESRC:=test.c
FILEEXE:=main_shared
LIBDIR:=shared
CSTD:=11
OPENMP:=n
ASAN:=n
UBSAN:=n
EXTENSION:=
TEST_ENV:=LD_LIBRARY_PATH=$(LIBDIR)
CFLAGS:=-Wall -pedantic -lm
AGGRESSIVE_WARNINGS=n

ifeq ($(CC),pgcc)
        CFLAGS+=-c$(CSTD)
else
        CFLAGS+=-std=c$(CSTD)
endif

ifeq ($(OPENMP),y)
        ifeq ($(CC),pgcc)
                CFLAGS+=-mp
        else
                CFLAGS+=-fopenmp
        endif
endif

ifneq ($(SANITIZER),)
        CFLAGS+=-fsanitize=$(SANITIZER)
endif

ifneq ($(CC),pgcc)
        ifeq ($(EXTRA_WARNINGS),y)
                CFLAGS+=-Wall -Wextra -Werror
        endif

        ifeq ($(ASAN),y)
                CFLAGS+=-fsanitize=address
        endif

        ifeq ($(UBSAN),y)
                CFLAGS+=-fsanitize=undefined
        endif
endif

$(FILEEXE)$(EXTENSION): munit.h munit.c $(FILESRC)
	$(CC) -o $@ munit.c $(FILESRC) $(CFLAGS)

test:
	$(TEST_ENV) ./$(FILEEXE)$(EXTENSION)

clean:
	rm -f $(FILEEXE)$(EXTENSION)
	rm -f test.o
	rm main_shared

all: $(FILEEXE)$(EXTENSION)

test.o:
	@echo "Making test.o"
	@$(CC) -c $(CFLAGS) test.c -o test.o
	@echo "Done with test.o"

main_shared: test.o munit.h munit.c $(FILESRC)
#Compile main to use the shared library
	@echo "Compiling Main to use shared libraries"
	@gcc test.o munit.c -L$(LIBDIR) -lnumerical -o main_shared $(CFLAGS)
	@echo "Done compiling main."
	@echo "Running main with Shared Libraries"
	@LD_LIBRARY_PATH=$(LIBDIR) ./main_shared