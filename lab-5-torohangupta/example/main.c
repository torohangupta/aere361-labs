#include <stdio.h>

double ext_func(double);

double sum_to_100(double (*funcp)(double)) {
    double sum = 0.0;

    int i;
    for(i = 1; i <=100; i++) {
        sum += funcp((float) i);
    }

    return sum;
}

int main(void) {
    double  sum;

    sum = sum_to_100(ext_func);
    printf("Sum of external function from 1 to 100: %g\n", sum);

    return 0;
}
