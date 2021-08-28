/*
AerE 361 Lab 3
Exercise 7
SOLUTION
Matthew E. Nelson
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------
	char number[100]="0";

	unsigned long i=0, ans=0, n = 0;
	int reply = 0;
	bool state = true;

//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
	char *a = argv[2];
	if ( argc > 1){
		strcpy(number,argv[1]);
		reply = atoi(a);
		state = false;
	}
//----------------------------------------------------------------
// Insert your code here
// ---------------------------------------------------------------
do{
		if (argc == 1){
			printf("Enter 1 for Brute Force Adder, 2, for Gauss Adder, or 3 to quit: ");
			scanf(" %d", &reply);
			if (reply == 3){
				state = false;
				printf("Ending program.\n");
				return 0;
			}
			printf("Enter a number: ");
			scanf(" %s", number);
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

// Insert your brute foce adder here.
if (reply == 1){
		for (i=1; i <= num; i++) {
    ans += i;
  }
	printf("Using a brute force adder, the answer is: %ld.\n", ans);
}

// Insert your gauss adder here.
if (reply == 2){
	ans = num*(num+1)/2;
	printf("Using a gauss adder, the answer is: %lu.\n",ans);
}

	} while (state);
  return 0;
}
