
/* 
AerE 361 Lab 5
Exercise 1-4
Main Function for Integrand
Matthew E. Nelson
*/
//
// Created by Matt Kreul on 10/1/20.
//

// ------------------------- includes -------------------------
#include <stdio.h>
#include "integration.c"
#include <math.h>
#include <stdlib.h>

//  ------------------------ functions ------------------------
double integrand(double x){
	// The autograder uses sin(x) for testing your values
	// While you can change this, make sure you set to 
	// sin(x) when done and for final submission
	return sin(x);
}

// Forward declaration of function prototypes here

//  ---------------------- main function ----------------------
int main(int argc, char ** argv) {
	double ans, a, b;
	int c;

	if (argc > 1) {
        // ------------------- autograder input -------------------
		a = atof(argv[1]);
		b = atof(argv[2]);
		c = atoi(argv[3]);

	} else {
        // ---------------------- user input ----------------------
		a = 0;
		b = 2;
		c = 4;

	}

// Do not change any of this or the autograder may not work
	ans = midpoint(integrand, a, b);
	printf("Midpoint integration: %g\n", ans);

	ans = simpson_13(integrand, a, b);
	printf("Simpson's 1/3 Rule: %g\n", ans);

	ans = simpson_38(integrand, a, b);
	printf("Simpson's 3/8 Rule: %g\n", ans);

	ans = gauss_quad(integrand, a, b, 10);
	printf("Gauss Quad: %g\n", ans);
	
	return 0;
}
