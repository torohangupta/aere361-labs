/*
AerE 361
Lab 4
Exercise 2
Rohan Gupta
*/

// add includes
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// begin main
int main (int argc, char *argv[]) {
  
  // ------------------- predefined variables -------------------
  int number;
  FILE *pFile;
  char filename[100];
  char val[3];
  char *a = argv[2];
  int len;
  
  // -------------------------- inputs --------------------------
  if ( argc > 1) {
    strcpy(filename, argv[1]);
    number = atoi(a);

  } else {
		printf("Please let me know the filename: ");
  	fgets(filename, 100, stdin);
  	len = strlen(filename);
  	filename[len-1] = 0;

    // ask for number of lines to read
	  printf("Please enter the number of lines to print: ");
  	scanf("%d", &number);
  }


  // -------------------------- output --------------------------
  // open file
  pFile = fopen(filename, "r+");

  // for loop to read the file
  for(int i = 0; i <= number+2; i++) {
    // use fgets() to get the file stored in pFile, the line to read i, and store the value in val. Then, print the value val.
    fgets(val, i, pFile);
    printf("%s", val);
  }

  // close the file
  fclose(pFile);
  return 0;
}