/*
AerE 361 Lab 3
Exercise 2
SOLUTION
Matthew E. Nelson
*/
#include <stdio.h>
#include <stdlib.h>
//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
int main(int argc, char *argv[]){
	int age;
  char *a = argv[1];

  if ( argc == 1) {
	  printf( "Please enter your age: " );
	  scanf( "%d", &age );
  }
  else {
    age = atoi(a);
  }
  //----------------------------------------------------------------
  // Below here write your if statements. Remember that you need
  // to be exact in your text, including the extra space at the end.
  // ---------------------------------------------------------------
if (age < 18) {
  printf("You are under 18. You are pretty young!\n");
} else if (age >= 10 && age <= 25) {
  printf("You are between the age of 18 and 25. You are pretty young!\n");
} else if (age > 25 && age <40) {
  printf("You are between the age of 26 and 39. You are pretty young!\n");
} else if (age >= 40 && age <=50) {
  printf("You are between the age of 40 and 50. You are pretty young!\n");
} else if (age > 50 && age <= 100) {
  printf("You are between the age of 51 and 100. You are old!\n");
} else if (age > 100) {
  printf("You are over 100 years old! You are really old!\n");
}
// A return 0; let's the OS know that the condition exited normally. So keep
// this here so the autograder know your program didn't crash.
	return 0;
}
