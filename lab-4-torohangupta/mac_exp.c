/*
AerE 361
Lab 4
Exercise 4
Rohan Gupta
*/

// add includes
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

// factorial function
double factorial(int number) {
  double value = 1;

  while (number - 1 != 0) {
    value = value*number;
    number = number - 1;
  }

  return value;
}

// begin main
int main(int argc, char *argv[]) {

  // ------------------- predefined variables -------------------
  int iterator = 1;
  double userInput;
  double ans = 0;
  double prevAns = 0;
  double error = 100;
  double allowableError = 0;

  // -------------------------- inputs --------------------------
  if ( argc > 1 ){
    // autograder input
    char *a = argv[1];
    char *b = argv[2];

		userInput = atof(a);
    allowableError = atof(b);
	
  } else {
    // user input
    printf("Number to take the Maclaurin Expansion of: ");
  	scanf("%lf",&userInput);

		printf("Allowable Error: ");
  	scanf("%lf", &allowableError);
	}

  // ----------------------- calculations -----------------------
  while (error > allowableError) {
    prevAns = ans;
    ans = prevAns + pow(userInput, iterator)/factorial(iterator);
    error = fabs(ans-prevAns);
    iterator++;
  }
  
  // -------------------------- output --------------------------
  printf("After %d terms in the series, exp(%lf) is approx. %lf with an error of %lf \n", iterator-1, userInput, ans+1, error);

  return 0;
}