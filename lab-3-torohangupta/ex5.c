/* 
AerE 361 Lab 3
Exercise 5
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
  
	unsigned long i, ans, n = 0;
  
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
	if ( number[0] != 45 && (number[0] < 48 || number[0] > 57)) {
    printf("That is not an integer.\n");
  return 0;
  }

  for (i = 1; number[i] != 0; i++){
    if ( number[i] < 48 || number[i] > 57 ) {
      printf("That is not an integer.\n");
    return 0;
    }
  }
//Convert our string to an unsigned long int
	n = strtoul(number, NULL, 10);
// Insert your brute foce adder here.
	for (i=1; i <= n; i++) {
    ans += i;
  }

// Print our values.
	printf("Using a brute force adder, the answer is: %lu.\n",ans);
  return 0;
}