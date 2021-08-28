/*
AerE 361 Lab 3
Exercise 1
SOLUTION
Matthew E. Nelson
*/
#include <stdio.h>
#include <stdlib.h>

/*
This main program might look a little different. The main program
is like any other function and we can pass data into it. The
autograder takes advantage of this and passes data into the
program to be tested. In order to do this, we use int argc and
char *argv[]. argc tells us if anything is there and argc is the
character array of the data. Notice that we will need to convert
this character array to int or floats later
*/
int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here write define your variables as outlined in the
// lab writeup.
// ---------------------------------------------------------------
unsigned short JanSold = 7064;
unsigned short FebSold = 20382;
unsigned short MarSold = 18156;
unsigned short AprSold = 19296;
unsigned short MaySold = 13848;
unsigned short JuneSold = 30500;
unsigned short JulySold = 1018;
unsigned short AugSold = 1603;
unsigned short SepSold = 23517;
unsigned short OctSold = 18218;
unsigned short NovSold = 25265;
unsigned short DecSold = 3871;
float revPershare = 4.5;
//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
if ( argc == 1) {
	  printf("Using built in values.\n\n");
  }
  else {
  	char *a = argv[1];
  	char *b = argv[2];
		char *c = argv[3];
  	char *d = argv[4];
		char *e = argv[5];
  	char *f = argv[6];
		char *g = argv[7];
  	char *h = argv[8];
		char *i = argv[9];
  	char *j = argv[10];
		char *k = argv[11];
  	char *l = argv[12];
		char *m = argv[13];

	/* The data passed in is a character, atoi and atof converts
	this from a character to an integer (atoi) or a float (atof)
	*/
  	JanSold = atoi(a);
		FebSold = atoi(b);
		MarSold = atoi(c);
		AprSold = atoi(d);
		MaySold = atoi(e);
		JuneSold = atoi(f);
		JulySold = atoi(g);
		AugSold = atoi(h);
		SepSold = atoi(i);
		OctSold = atoi(j);
		NovSold = atoi(k);
		DecSold = atoi(l);
		revPershare = atof(m);
	}

  //----------------------------------------------------------------
  // Calculate Q1, Q2, Q3 and Q4 sales and the Revenue for each Quarter
  // Finally, calculate the total sales and revenue for the year
  // ---------------------------------------------------------------
unsigned int Q1 = JanSold + FebSold + MarSold;
unsigned int Q2 = AprSold + MaySold + JuneSold;
unsigned int Q3 = JulySold + AugSold + SepSold;
unsigned int Q4 = OctSold + NovSold + DecSold;

float Q1_rev = (Q1/150.0)*revPershare;
float Q2_rev = (Q2/150.0)*revPershare;
float Q3_rev = (Q3/150.0)*revPershare;
float Q4_rev = (Q4/150.0)*revPershare;

unsigned int yearSold = Q1+Q2+Q3+Q4;
float RevYear = Q1_rev+Q2_rev+Q3_rev+Q4_rev;
// This is for the autograder, do not change
	if ( argc > 1) {
		printf("yearSold: %d  RevYear: %.2f",yearSold,RevYear);
	}
	else {
	//Put your code here for printing out the values.
printf("2020 GameStop Sales Report.\n");
printf("===========================\n");
printf("Stock sold in\n");
printf("\tJan: %d\n", JanSold);
printf("\tFeb: %d\n", FebSold);
printf("\tMar: %d\n", MarSold);
printf("===========================\n");
printf("Total in Q1: %d\n", Q1);
printf("===========================\n");
printf("Stock sold in\n");
printf("\tApr: %d\n", AprSold);
printf("\tMay: %d\n", MaySold);
printf("\tJun: %d\n", JuneSold);
printf("===========================\n");
printf("Total in Q2: %d\n", Q2);
printf("===========================\n");
printf("Stock sold in\n");
printf("\tJul: %d\n", JulySold);
printf("\tAug: %d\n", AugSold);
printf("\tSep: %d\n", SepSold);
printf("===========================\n");
printf("Total in Q3: %d\n", Q3);
printf("===========================\n");
printf("Stock sold in\n");
printf("\tOct: %d\n", OctSold);
printf("\tNov: %d\n", NovSold);
printf("\tDec: %d\n", DecSold);
printf("===========================\n");
printf("Total in Q4: %d\n\n", Q4);
printf("Total Sales revenue in Q1 is: $%0.2f\n", Q1_rev);
printf("Total Sales revenue in Q2 is: $%0.2f\n", Q2_rev);
printf("Total Sales revenue in Q3 is: $%0.2f\n", Q3_rev);
printf("Total Sales revenue in Q4 is: $%0.2f\n", Q4_rev);
printf("Total Sales revenue for the year is: $%0.2f\n", RevYear);

	//Nothing else should be changed below
	}
	return 0;
}
