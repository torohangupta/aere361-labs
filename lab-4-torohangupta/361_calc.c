/*
AerE 361
Lab 4
Exercise 4
Rohan Gupta
*/

// ------------------------- includes -------------------------
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <string.h>


//  ------------------------ functions ------------------------
void menu() {
  printf ("\n\nWelcome to the 361 Math program.\n");
  printf ("====================================\n\n");
  printf (" Please select from one of the following options.\n\n");
  printf (" 1.... Brute Force Adder \n") ;
  printf (" 2.... Gauss Adder \n");
  printf (" 3.... Compute Factorial \n") ;
  printf (" 4.... Compute Series Value \n");
  printf (" 0.... Exit Program \n\n");
  printf ("====================================\n");
  printf ("Enter option : ");
}

unsigned long bruteForce(unsigned long int number) {
  unsigned long ans = 0;

  for (unsigned long i = 1; i <= number; i++) {
    ans += i;
  }
  
  return ans;
}

unsigned long gauss(double number) {
  return number*(number+1)/2;
}

int factorial(int number) {
  int value = 1;

  while (number - 1 != 0) {
    value = value*(number);
    number = number - 1;
  }

  return value;
}

double series(float a, int number) {
  double answer = a;

  for (int i = 1; i <= number; i++) {
    answer = answer + (a / factorial(i));
  }

  return answer;
}

// begin main
int main(int argc, char *argv[]) {

  // ------------------- predefined variables -------------------
  bool state = true;
  int choice = 1;
  int input1 = 0;
  float input2 = 0;

    // -------------------- autograder inputs ---------------------
    if (argc > 1) {
      char *a = argv[1];
      char *b = argv[2];

      choice = atoi(a);
      input1 = atoi(b);

      state = false;
      
      if (choice == 4) {
        char *c = argv[3];
        input2 = atof(c);
      }

    } else {
      menu();
      scanf(" %d", &choice);
    }

    // ----------------------- user inputs ------------------------
    if (argc == 1 && (choice == 1 || choice == 2 || choice == 3)) {
      printf("\n\nItems to compute: ");
      scanf("%d", &input1);
    }
    if (argc == 1 && choice == 4) {
      printf("\n\nSeries Constant: ");
      scanf("%f", &input2);

      printf("Iterations: ");
      scanf("%d", &input1);
    }

    // ------------------------- outputs --------------------------
    switch (choice) {
      case 1:
        printf("Using a brute force adder, the answer is: %ld.\n", bruteForce(input1));
        break;

      case 2:
        printf("Using a Gauss adder, the answer is: %lu.\n", gauss(input1));
        break;

      case 3:
        printf("The factorial of %d is %d.\n", input1, factorial(input1));
        break;

      case 4:
        printf("The Series Value of %d and %0.2f is %0.4f.\n", input1, input2, series(input2, input1));
        break;

      case 0:
        state = false;
        printf("Ending program...\n");
        break;

      default:
        printf("You did not list a valid value! Try again!\n");
        break;
    }

  return 0;
}