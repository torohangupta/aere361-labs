#include <time.h>
#include <stdio.h>

#define DIM 1024

int col_test(){

    size_t i,j;
    int matrix [DIM][DIM];

    for (i=0;i< DIM; i++){
        for (j=0;j <DIM;j++){
            matrix[j][i]= i*j;
        }
    }
    return 0;
}

int row_test(){
    size_t i,j;
    int matrix [DIM][DIM];

    for (i=0;i< DIM; i++)
        for (j=0;j <DIM;j++)
            matrix[i][j]= i*j;

    return 0;
}

int main()
{
    clock_t tic, toc;
    double col_time, row_time;

    tic = clock();
    col_test();
    toc = clock();
    col_time = (double)(toc - tic) / CLOCKS_PER_SEC;

    tic = clock();
    row_test();
    toc = clock();
    row_time = (double)(toc - tic) / CLOCKS_PER_SEC;

    printf("Column Order: %f seconds\n", col_time);
    printf("Row Order: %f seconds\n", row_time);
    printf("Speed change: %g percent\n", ((row_time - col_time)/col_time)*100.00);

    return 0;
}
