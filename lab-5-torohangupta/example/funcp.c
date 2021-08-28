#include <stdio.h>

double sum_to_100(double (*funcp)(double)) {
    double sum = 0.0;

    int i;
    for(i = 1; i <=100; i++) {
        sum += funcp((float) i);
    }

    return sum;
}

double square(double x) {
    return x * x;
}

int main(void) {
    double  sum;

    sum = sum_to_100(square);
    printf("Sum of x^2 from 1 to 100: %g\n", sum);

    return 0;
}
