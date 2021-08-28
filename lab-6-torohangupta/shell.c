/*
AerE 361
Lab 6
Exercise 3
Rohan Gupta
*/

// ------------------------- includes -------------------------
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// begin main
int main(int argc, char *argv[]) {
    // ------------------- predefined variables -------------------
    int number;
    int x, y; // current position
    int d = 0; // set initial direction
    int c = 1;
    int s = 1;
    int **out;
    char filename[7] = "ans.out";
	FILE *pFile;

    // ----------------------- user inputs ------------------------
    printf("Input: ");
    scanf(" %d", &number);

    // ensure number is in bounds
    if (number < 1 || number > 100) {
        return printf("That number is out of bounds!");
    }

    // Allocate memory using malloc()
    out  = (int **)malloc(sizeof(int *) * number);
    if (out == NULL) {
        printf("Error 1: malloc() error...\n");
        exit(0);
    }
    out[0] = (int *)malloc(sizeof(int) * number);
    if (out[0] == NULL) {
        printf ("Error 2: malloc() error...\n");
        exit(0);
    }
    for (int i = 0; i < number; i++) {
        out[i] = malloc(sizeof(int)*number);
    }

    // ------------------------ processing ------------------------
    // check for even or odd and then list initial x & y position
    if (number % 2 == 0) {
        x = (int)(floor(number/2))-1;
        y = (int)(floor(number/2))-1;

    } else {
        x = (int)(floor(number/2));
        y = (int)(floor(number/2));

    }
    
    // do funky logic to mess with direction
    for (int k = 1; k < number; k++) {
        for (int j = 0; j<(k<(number-1)?2:3); j++){
            for (int i = 0; i < s; i++) {
                out[x][y] = c;
                c++;
                switch (d) {
                    case 0:
                        y = y + 1;
                        break;
                    case 1:
                        x = x + 1;
                        break;
                    case 2:
                        y = y - 1;
                        break;
                    case 3:
                        x = x - 1;
                        break;
                }
            }
            d = (d+1)%4;
        }
        s=s+1;
    }
    out[x][y] = c;

    // ------------------------- outputs --------------------------
    for (int r = 0; r<number; r++) {
        for (int c = 0; c<number; c++) {
            printf("%d ", out[r][c]);
        }
        printf("\n");
    }

    int width = 0;
    while (c > 0) {
        c /= 10.0;
        width++;
    }

    pFile = fopen(filename, "w+");
    for (int i=0; i < number; i++) {
        for (int j=0; j < number; j++) {
            fprintf(pFile, " %*d", width, out[i][j]);
        }
        fprintf(pFile, "\n");
    }
    fclose(pFile);
    
    free(out);
    return 0;
}