/*
AerE 361
Rohan Gupta
Section 1
Lab 7
*/

// ------------------------- includes -------------------------
#include <stdio.h>
#include <stdbool.h>
#include "add.h"
#include "answer.h"
#include "csvparser.h"
#include "mycsv.h"


//  ---------------------- main function ----------------------
int main(int argc, char* argv[]) {
	short int status = 0;

	// ------------------------- Ex 1 -------------------------
	setSummand(5);
	printf("5 + 7 = %d\n", add(7));
	printf("What is the answer to life ?\n\n") ;
	printf("And the answer is: %d\n", answer());


	// ------------------------- Ex 6 -------------------------
	status = mycsv(false,"data/example_file.csv","output1.csv",true);
	status = mycsv(true,"data/example_file_with_header.csv","output2.csv",true);
	status = mycsv(false,"data/gps_log.txt","output3.csv",false);
	status = mycsv(true,"data/attitude.txt","output4.csv",false);
	if (status == 1)
		printf("An error occured running the CSVParser.\n");
	else
		printf("Data has been parsed.\n");

  return 0;
}
