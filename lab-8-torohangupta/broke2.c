/*
AerE 361 Lab 8
Exercise 3
Rohan Gupta
*/
 
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int ComputeFactorial(int number) {
  int facto = 0;

  for (int j = 1; j <= number; j++) {
    facto = facto * j;
  }

  return facto;
}

double ComputeSeriesValue(double x, int n) {
  double seriesValue = 0.0;

  for (int k = 0; k <= n; k++) {
    seriesValue += x / ComputeFactorial(k);
  }

  return seriesValue;
}

void StringTest() {
  char *temp = "HelLo";

  int i = 0;

  temp[3]='l';

  for (i = 0 ; i < 5 ; i++ )
    printf("%c\n", temp[i]);
}

int main(int argc, char ** argv) {
	double x = 0.0;
	int n=0;
	if(argc > 1){
    
		x = atol(argv[1]);
		n = atoi(argv[2]);
  }
  else{
  printf("This program is used to compute the value of the following series :\n");
  printf("x/0! + x/1! + x/2! + x/3! + x/4! + ........ + x/n! ");

  
  printf("Please enter the value of x : ");
  scanf("%lf", &x);

  printf("Please enter an integer value for n :");
  scanf("%d", &n);

  double seriesValue = ComputeSeriesValue(x, n);
  printf("The value of the series for the values entered is %f\n", seriesValue);

  printf("String testing...\n");
  StringTest();
	}
  return 0;
}
