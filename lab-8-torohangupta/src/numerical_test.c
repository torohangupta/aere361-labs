/*
AerE 361 Lab 8
Exercise ?
SOLUTION
Matthew E. Nelson
*/


 /* µnit is MIT-licensed, but for this file and this file alone:
 *
 * To the extent possible under law, the author(s) of this file have
 * waived all copyright and related or neighboring rights to this
 * work.  See <https://creativecommons.org/publicdomain/zero/1.0/> for
 * details.
 *********************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#define MUNIT_ENABLE_ASSERT_ALIASES
#include "../munit/munit.h"
#include "../include/numerical.h"

#define g(x) sqrt(x+6)
#define gd(a0) (0.5/sqrt(a0+6))
#define f1(x) (x*x-x-6)
#define f(x) (pow(x,3)-18)
#define MAX_COUNT 5000


/****** FUNCTION PROTOTYPES***************************************/
int ComputeFactorial_broke(int number);
double ComputeSeriesValue_broke(double x, int n);
double FixedPointItr_broke(double x0);
double Secant_broke(double x0, double x1);


/*****************************Testing suite********************************
* The following code is used for our testing suite. The code uses code from
* µnit, an open source unit testing program. This allows us to do things
* such as compare values, generate random numbers, and even pass in parameters
* µnit also will give us timing information as well which can be useful for
* looking at performance of our code. µnit is licensed under a MIT-license
* You can find more about it here -  https://nemequ.github.io/munit/
* *************************************************************************/

static MunitResult
test_factorial(const MunitParameter params[], void* user_data) {

	int random_int;
	int factor=0;
	int factor_test=0;

  munit_uint8_t data[10];
  (void) params;
  (void) data;

  random_int = munit_rand_int_range(1, 20);
  assert_int(random_int, >=, 1);
  assert_int(random_int, <=, 20);

	factor = ComputeFactorial(random_int);
	factor_test = ComputeFactorial_broke(random_int);

	assert_int(factor,==,factor_test);

	return MUNIT_OK;
}

static MunitResult
test_series(const MunitParameter params[], void* user_data) {
	int random_int;
	double random_dbl;

  munit_uint8_t data[10];
  (void) params;
  (void) data;

  random_int = munit_rand_int_range(1, 20);
  munit_assert_int(random_int, >=, 1);
  munit_assert_int(random_int, <=, 20);
  random_dbl = munit_rand_double();
	random_dbl = random_dbl * 1000.0;
  munit_assert_double(random_dbl, >=, 0.0);
  munit_assert_double(random_dbl, <=, 1000.0);
  munit_rand_memory(sizeof(data), data);
	double test_series = ComputeSeriesValue(random_dbl, random_int);
	double series = ComputeSeriesValue_broke(random_dbl, random_int);
	assert_double_equal(series,test_series,12);
	return MUNIT_OK;
}

static MunitResult
test_fixedpt(const MunitParameter params[], void* user_data) {

	double random_dbl;

  munit_uint8_t data[10];
  (void) params;
  (void) data;

  random_dbl = munit_rand_double();
	random_dbl = random_dbl * 1000.0;
  munit_assert_double(random_dbl, >=, 0.0);
  munit_assert_double(random_dbl, <=, 1000.0);
  munit_rand_memory(sizeof(data), data);
	double test_fixed = FixedPointItr(random_dbl);
	double fixed = FixedPointItr_broke(random_dbl);
	assert_double_equal(fixed,test_fixed,10);

	return MUNIT_OK;
}

static MunitResult
test_secant(const MunitParameter params[], void* user_data) {
	double random_dbl1;
	double random_dbl2;

  (void) params;

	random_dbl1 = munit_rand_double();
	random_dbl1 = random_dbl1 * 1000.0;
  munit_assert_double(random_dbl1, >=, 0.0);
  munit_assert_double(random_dbl1, <=, 1000.0);

	random_dbl2 = munit_rand_double();
	random_dbl2 = random_dbl2 * 1000.0;
  munit_assert_double(random_dbl2, >=, 0.0);
  munit_assert_double(random_dbl2, <=, 1000.0);

	double test_secant = Secant(random_dbl1, random_dbl2);
	double secant = Secant_broke(random_dbl1, random_dbl2);
	assert_double_equal(test_secant,secant,10);

	return MUNIT_OK;
}

/* Creating a test suite is pretty simple.  First, you'll need an
 * array of tests: */
static MunitTest test_suite_tests[] = {
	{ (char*) "/test/Factorial Functions\n",test_factorial,NULL,NULL,MUNIT_TEST_OPTION_NONE,NULL},
	{ (char*) "/test/Series Functions\n",test_series,NULL,NULL,MUNIT_TEST_OPTION_NONE,NULL},
  { (char*) "/test/Fixed Point Iterations Functions\n",test_fixedpt,NULL,NULL,MUNIT_TEST_OPTION_NONE,NULL
  },
  { (char*) "/test/Secant Functions\n\r\n", test_secant, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL },
  { NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL }
};


/* Now we'll actually declare the test suite.  You could do this in
 * the main function, or on the heap, or whatever you want. */
static const MunitSuite test_suite = { (char*) "",test_suite_tests,NULL,1,MUNIT_SUITE_OPTION_NONE};

/*****************************Main Program********************************
* Our main program will execute our code, but at the end it will also run our
* Unit tests as well. Note that our code runs, but the unit tests fail
* This is where you will need to debug the issue and fix them
* *************************************************************************/


int main(int argc, char* argv[MUNIT_ARRAY_PARAM(argc + 1)]) {

	//ComputeSeriesValue_broke(105.897, 5);
	//FixedPointItr_broke(90.576897);
	//Secant_broke(1, 2);
  /* Finally, we'll actually run our test suite!  That second argument
   * is the user_data parameter which will be passed either to the
   * test or (if provided) the fixture setup function. */
  return munit_suite_main(&test_suite, (void*) "µnit", argc, argv);
}

/*****************************Functions*************************************
* These are the functions that are broke. The test program will call these
* functions and then compare them with known working functions in the shared
* library we provided. You will want to fix these so they pass the unit tests
* *************************************************************************/

int ComputeFactorial_broke(int number) {
  int fact = 1;
  int j;

  for (j = 1; j <= number; j++) {
    fact = fact * j;
  }
  return fact;
}

double ComputeSeriesValue_broke(double x, int n) {

  double seriesValue = 0.0;
  int k;

  for (k = 0; k <= n; k++) {
    seriesValue += x / ComputeFactorial_broke(k);
  }

  return seriesValue;
}

double Secant_broke(double x0, double x1) {

	double x2,error;
	#ifdef DEBUG
		printf("\nIte\t\tX0\t\t\tX1\t\t\tf(X0)\t\t\tf(X1)\t\tError\n");
		printf("-----------------------------------------------------------------------\n");
	#endif
	do{
    x2=((x0*f(x1))-((x1)*f(x0)))/((f(x1)-f(x0)));
		#ifdef DEBUG
			int i=0;
    	printf("%d\t\t%4.5f\t%4.5f\t%4.5f\t%4.5f\t%4.5f\n",i++,x0,x1,f(x0),f(x1),error);
		#endif
    error=fabs((x2)-(x1));
    x0=x1;
    x1=x2;
	}while(error>0.00005);

	return x0;

}

double FixedPointItr_broke(double x0) {

	int count=0;
	double x1=0,error=0;
	char iffound=0;
	do{
    x1=g(x0);
    error=fabs(x1-x0);
    if(count==0)
      {
        if(gd(x0)>1){
          printf("\nThe equation is not convergent");
          iffound=1;
          break;
        }
        else{
					printf("\nThe equation is convergent.\n");
				#ifdef DEBUG
          printf("\n   i    xi      f(xi)          error");
        	printf("\n-------------------------------------------");
				#endif
        }
      }
			#ifdef DEBUG
      	printf("\n %3d  %3.5f    %3.5f  %3.5f",count,x0,f1(x0),count==0?0:error);
			#endif
      x0=x1;
      count++;
	}while(error>0.0005 && count<MAX_COUNT);

	if(!iffound)
  	printf("\nThe required root is: %f\n",x0);
	return x0;
}
