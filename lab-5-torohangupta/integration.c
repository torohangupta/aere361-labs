/*
AerE 361
Lab 5
Exercise 1
Rohan Gupta
*/

// ------------------------- includes -------------------------
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "gauss_quad_dependency.c"

//  ------------------------ functions ------------------------

double midpoint(double (*func)(double), double a, double b) {
    return (b-a)*(*func)((a+b)/2);
}

double simpson_13(double (*func)(double), double a, double b) {
    return ((b-a)/6)*((*func)(a) + 4*(*func)((a+b)/2) + (*func)(b));
}

double simpson_38(double (*func)(double), double a, double b) {
    return ((b-a)/8)*((*func)(a) + 3*(*func)(((2*a)+b)/3) + 3*(*func)((a+(2*b))/3) + (*func)(b));
}

double gauss_quad(double (*func)(double), double a, double b, int order) {
    double c = (1.0/2.0) * (b + a);
    double m = (1.0/2.0) * (b - a);
    double ans = 0;

    for (int i = 1; i <= order; i++) {
        ans += w(order, i)*(*func)(c + (m*t(order, i)));
    }
    
    return ans*m;
}