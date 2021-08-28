/*This is an example template for the Gauss Jordan exercise. You are not required to use it. 
It simply provides an example structure to get you started.
This code does not compile and run on its own; it is a template only.*/

#include <stdio.h>
#include <stdlib.h>

int main(void) {
    /* Declare Vairables */
    int i,j,k,n,t; /*iterators*/
    float **matrix;
    float multiplier=0;
    float *solution;
    /* You'll need a few more variables, including a matrix */

    /* Request System Order (Number of Equtions) */
    printf("\nHow many equations: ");
    scanf("%d", &n);

    /* Allocate Dynamic Veriables
       (psst... malloc is pretty good at this) */
    matrix = malloc(sizeof(double *) *(n+1));
    for (t = 0; t < (n+1); ++t) {
      matrix[t] = malloc(sizeof(double) *(n+1));
  }
    solution = malloc(sizeof(double *) *n);

    
    /* Request Augmented Matrix Values */
    printf("\nEnter the elements of augmented matrix row-wise:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j <= n; j++) {
            printf(" Matrix[%d][%d]:", i, j);
            scanf("%f", &matrix[i][j]);
        } /*end for*/
    } /*end for*/

    /* Diagnolize the matrix */
    for (j = 0; j < n; j++) {
      for (i = 0; i < n; i++) {
            if (i != j) {
	      multiplier=matrix[i][j]/matrix[j][j];
	      //printf("multiplier: %lf\n",multiplier);
	      for (k = 0; k < (n+1); k++) {
		matrix[i][k]=matrix[i][k]-(multiplier*matrix[j][k]);
		//printf("matrix[i][k] = %f\n",i,k,matrix[i][k]);
                    /*This is where the magic happens ... */
                }  /*end for*/
            } /*end if*/
        } /*end for*/
    } /*end for*/

    printf("\nThe solution is:\n");
    for (i = 0; i < n; i++) {
      solution[i]=(matrix[i][n])/(matrix[i][i]);
        printf("\n solution%d=%f\n", i, solution[i]);
    } /*end for*/
    
    return 0; /*exit normally*/
} /*end main*/
