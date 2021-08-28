# Lab 9 Makefile
# AerE 361
IDIR=./include
CFLAGS=-I$(IDIR) -Wall -std=c11

all:
# compile decode.c using shared libraries
	@echo "Compiling to use shared libraries"
	@gcc $(CFLAGS) -lm src/fit.c src/fit_convert.c src/fit_crc.c src/fit_product.c src/fit_ram.c src/decode.c -o convert_fit
	@echo "Done compiling."

run: clean all
# run the file
	@./convert_fit ./data/aere361_data.fit

graph: run
	gnuplot plots.plt

clean:
	@clear
	@echo "Cleaning up all generated files"
	@find . -type f -name '*.o' -delete
	@find . -type f -name '*.a' -delete
	@find . -type f -name '*.so' -delete
	@echo "Cleaning up executable files and outputs"
	@rm -f gps_log.txt attitude_log.txt
	@find . -type f -name '*.svg' -delete
	@find . -type f -name 'convert_fit' -delete
	@echo "Done cleaning"
