#include <stdio.h>

#define DIM 1024

int main(){

    size_t i,j;
    int matrix [DIM][DIM];

    for (i=0;i< DIM; i++){
        for (j=0;j <DIM;j++){
            matrix[j][i]= i*j;
        }
    }
    return 0;
}