/*
AerE 361 Lab 3
Exercise 4
SOLUTION
Matthew E. Nelson
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------
// Define a char called number and set it to [100] elements
  char number[100];
	//You will need a loop, you should declare that integer here.
//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
  if ( argc == 1) {
	  printf("Enter a number: ");
	  scanf(" %s", number);
  }
  else {
		strcpy(number,argv[1]);
  }

//----------------------------------------------------------------
// Insert your code here
// ---------------------------------------------------------------
for(int i = 0; i < sizeof(number); i++) {
  if ((number[i]>!48 && number[i]<!57) || number[i] == 46) {
      printf("That is not an integer.\n");
      return 0;
  }
}
printf("That is an integer!\n");
// Just a lonely return, add some code above to keep it company.
  return 0;
}
