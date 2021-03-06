/*-----------------------
AerE 361
Lab 10
Rohan Gupta
-------------------------*/

/*----------------------------
Original code information:
Licensing:
This code is distributed under the GNU LGPL license.

Modified: 14 December 2011
Author: John Burkardt

Modification by Matthew Nelson
Modified on April 19th, 2021
-------------------------*/
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <omp.h>

int main(int argc, char *argv[]);
double eval_f(double x);
double cpu_time();
void timestamp();
/*
  Purpose:
    MAIN is the main program for QUAD_OPENMP.
*/

int main(int argc, char *argv[]) {

  // Variables that we will use.
  double a = 0.0;
  double b = 10.0;
  double error;
  double exact = 0.49936338107645674464;
  int i;
  int n = 10000000;
  double total;
  double wtime;
  double x;

  timestamp();
  printf("\n");
  printf("QUAD_OPENMP:\n");
  printf("  Use OpenMP for parallel execution.\n");
  printf("  Estimate the integral of f(x) from A to B.\n");
  printf("  f(x) = 50 / ( pi * ( 2500 * x * x + 1 ) ).\n");
  printf("\n");
  printf("  A        = %f\n", a);
  printf("  B        = %f\n", b);
  printf("  N        = %d\n", n);
  printf("  Exact    = %24.16f\n", exact);

  wtime = omp_get_wtime();

  total = 0.0;
  // INSERT your code for the pragma for OpemMP
  // Setup the shared and private
  #pragma omp parallel shared(a, b, n) private(i, x)
  #pragma omp for reduction(+ : total)

  // Setup the reduction

  for (i = 0; i < n; i++) {
    x = ((double)(n - i - 1) * a + (double)(i)*b) / (double)(n - 1);
    total = total + eval_f(x);
  }

  wtime = omp_get_wtime() - wtime;

  total = (b - a) * total / (double)n;
  error = fabs(total - exact);

  printf("\n");
  printf("  Estimate = %24.16f\n", total);
  printf("  Error    = %e\n", error);
  printf("  Time     = %f\n", wtime);
  
  // Terminate
  printf("\n");
  printf("QUAD_OPENMP:\n");
  printf("  Normal end of execution.\n");
  printf("\n");
  timestamp();

  return 0;
}

// Functions
/*
  Function: f
  Purpose: F evaluates the function.

  Parameters:
  Input, double X, the argument.
  Output, double F, the value of the function.
*/

double eval_f(double x) {
  double r8_pi = 3.141592653589793;
  double value;
  // Insert the code based on the formula in the writeup
  value = 50.0/(r8_pi*(2500.0*x*x + 1.0));

  return value;
}

  /*
    Function: cpu_time
    Purpose: CPU_TIME reports the total CPU time for a program.

    Parameters:
    Output, double CPU_TIME, the current total elapsed CPU time in second.
  */
  double cpu_time() {
    double value;

    value = (double)clock() / (double)CLOCKS_PER_SEC;

    return value;
  }
  /*
    Function: timestamp
    Purpose:
    TIMESTAMP prints the current YMDHMS date as a time stamp.

    Example:
    31 May 2001 09:45:54 AM

    Parameters:
    None
  */

  void timestamp() {
  #define TIME_SIZE 40
  static char time_buffer[TIME_SIZE];
  const struct tm *tm;
  time_t now;

  now = time(NULL);
  tm = localtime(&now);

  strftime(time_buffer, TIME_SIZE, "%d %B %Y %I:%M:%S %p", tm);

  printf("%s\n", time_buffer);

  return;
  #undef TIME_SIZE
}