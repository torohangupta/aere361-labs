/*
AerE 361 Lab 3
Exercise 3
SOLUTION
Matthew E. Nelson
*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------
	const double discount1 = 0.10;
	const double discount2 = 0.15;
	const double discount3 = 0.20;
  double discount = 0.0;
  int unit_price = 0;
	double total_price = 0.0;
	int quantity = 0;

//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
  char *a = argv[1];
  char *b = argv[2];

  if ( argc == 1) {
	  printf("Enter the unit price for the item: ");
	  scanf(" %d", &unit_price);
    printf("Enter the number that you want to buy: ");
	  scanf(" %d", &quantity);
  }
  else {
    unit_price = atoi(a);
    quantity = atoi(b);
  }
  //----------------------------------------------------------------
  // Below here write your conditional statements. Remember that you need
  // to be exact in your text
  // ---------------------------------------------------------------
if (unit_price >= 20) {
  if (quantity > 50) {
    discount = discount3;
  } else if (quantity > 20) {
    discount = discount2;
  } else if (quantity > 10) {
    discount = discount1;
  }
} else {
  if (quantity > 50) {
    discount = discount3 - 0.05;
  } else if (quantity > 20) {
    discount = discount2 - 0.05;
  } else if (quantity > 10) {
    discount = discount1 - 0.05;
  }
}
total_price=unit_price*quantity*(1-discount);
discount=discount*100;


printf("You received a %0.f%% discount, and the price for %d units at $%d per unit is $%0.2f.\n", discount, quantity, unit_price, total_price );

	//Again, leave this little return alone, it just wants to return zeros, it's not hurting anybody
	return 0;
}
