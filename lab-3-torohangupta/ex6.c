/*
AerE 361 Lab 3
Exercise 6
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
	char number[100];

	unsigned long i, ans = 0, n = 0;

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

// Check that the value is indeed an integer (hint: look at previous Exercise)
for(int i = 0; i < sizeof(number); i++) {
  if ((number[i]>!48 && number[i]<!57) || number[i] == 46) {
      printf("That is not an integer.\n");
      return 0;
  }
}
	//Convert our string to an unsigned long int
  unsigned long num = strtoul(number, NULL, 10);

// Insert your gauss adder here.
ans =(num*(num+1))/2;

// Print our values.
printf("Using a gauss adder, the answer is: %ld.\n", ans);

//I'm still here
  return 0;
}
