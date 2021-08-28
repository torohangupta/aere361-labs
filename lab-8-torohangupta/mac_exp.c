#include <stdio.h>
#include <math.h>
#include <string.h>
#include <math.h>

double factorial(int n) {
	double fact = 1;
	int j; 
	
	for(j = 1; j <= n; j++) {
		fact = fact * j;
	}
	
	return fact;
}

int main() {
	double x; //Value within the exp(x)
	double err; //Value of error to check
	double ans = 0; 
	int itr = 0; //Iterations through the while loop
	double error_temp = 0; //Placeholder for the error
	double temp_2 = 0; //Placeholder for the previous maclaurin answer
	
	printf("Please enter a value for x: ");
	scanf("%lf", &x);
	
	
	if(x <= 0) {
		printf("Needs to be a positive number. \n");
		return -1;
	}
	
	printf("Please enter the allowable error for the function: ");
	scanf("%lf", &err);
	
	if(err <= 0) {
	printf("There needs to be an allowable error. \n");
	return -1;
	}
	
	
	while(1==1) {
		ans = ans + (pow(x, itr) / factorial(itr));
		error_temp = fabs(ans - temp_2); 
		if(error_temp > err) {
			temp_2 = ans;
			itr = itr + 1;
		}
		else {
			break; 
		}
	}
	
	printf("After %d terms in the series, exp(%lf) is approx. %lf with an error of %lf \n", itr, x, ans, error_temp);
	return 0;	
	
	
}

