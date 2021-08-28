#include <stdio.h>
int main(void) {
  unsigned char a1 = 125 , a2 = 126 , a3 = 127 , a4 = 128;
  unsigned char sum;
  sum = a1 + a2 + a3 + a4;
  printf("Total: %d\n", sum);
  return 0;
}