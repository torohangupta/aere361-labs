/*
AerE 361 Lab 8
Numerical Library Header
SOLUTION
Matthew E. Nelson

This library is used for the unit testing to verify the results
*/

#include <math.h>

/*Takes in an integeger and computes the Factorial.*/
int ComputeFactorial(int number);

double ComputeSeriesValue(double x, int n);

double Secant(double x, double y);

double FixedPointItr(double x);

void fft(double data_re[], double data_im[],const int N);

// helper functions called by the fft
// data will first be rearranged then computed
void rearrange(double data_re[],double data_im[],const int N);

void compute(double data_re[],double data_im[],const int N);