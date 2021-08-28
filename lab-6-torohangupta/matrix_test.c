#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[])
{
    if (argc != 3)
    {
    	printf ("usage: ./matrix row column\n");
    	exit (0);
    }
    int r = atoi (argv[1]), c = atoi (argv[2]);
    int **arr;
    int count = 0,i,j;

    arr  = (int **)malloc(sizeof(int *) * r);
    if (arr == NULL) {
    	printf ("first malloc error\n");
    	exit (0);
    }
    arr[0] = (int *)malloc(sizeof(int) * c * r);
    if (arr[0] == NULL) {
    	printf ("second malloc error\n");
    	exit (0);
    }

    for(i = 0; i < r; i++) {
        arr[i] = (*arr + c * i);
    }

    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            arr[i][j] = ++count;  // OR *(*(arr+i)+j) = ++count
	}
    }


    for (i = 0; i <  r; i++) {
        for (j = 0; j < c; j++) {
            printf("%d ", arr[i][j]);
	}
        printf("\n");
    }
    return 0;
}
