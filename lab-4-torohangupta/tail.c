/*
AerE 361
Lab 4
Exercise 3
Rohan Gupta
*/

// add includes
#include <stdio.h>
#include <stdlib.h>

// begin main
int main (int argc, char *argv[]) {
  
  // define variables & pointers 
  int number;
  FILE *pFile;
  char filename[16] = "number_list.txt";
  char val[3];
  int fileLength;
  
  char *a = argv[2];
  if (argc > 1) {
    number = atoi(a);
  } else {
    // ask for number of lines to read
    printf("Please enter the number of lines from the end to print: ");
    scanf("%d", &number);
  }

  // open file
	// printf("\nOpening file...\n\n");
  pFile = fopen(filename, "r+");

  // iterate though the text file to the line we want to start printing from
  for (int j = 0; j <= 102-(number); j++) {
    fgets(val, j, pFile);
  }

  // now that we are at "number" lines from the end, iterate and print each line
  for (int p = 1; p <= number+2; p++) {
    // use fgets() to get the file stored in pFile, the line to read i, and store the value in val. Then, print the value val.
    fgets(val, p, pFile);
    printf("%s", val);
  }

  // close the file
	// printf("\nClosing file... ");
  fclose(pFile);
	// printf("Done!\n");
}