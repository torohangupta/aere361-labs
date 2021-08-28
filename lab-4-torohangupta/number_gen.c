/*
AerE 361 Lab 4
Exercise 1
Number Generator
INSERT YOUR NAME HERE
*/

/*
Includes
--------------------------------------
*/
#include<stdio.h>
#include<string.h>

int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------
	int len;
  char filename[100];
  FILE *pFile;

//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------

	if ( argc > 1){
		strcpy(filename,argv[1]);
	}
	else{
		printf("Please let me know the filename: ");
  	fgets(filename,100,stdin);
  	len = strlen(filename);
  	filename[len-1] = 0;

	}
//----------------------------------------------------------------
// Insert your code here
// ---------------------------------------------------------------

  // save file location in pointer
  pFile = fopen(filename, "w+");

  // for loop to write to the file
  for(int i = 1; i <= 100; i++) {
   fprintf(pFile, "%d\n", i);
  }
  printf("File is ready!\n");

  // close the file
  fclose(pFile);

  return 0;
}
