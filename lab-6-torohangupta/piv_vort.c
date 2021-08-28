/*
AerE 361
Lab 6
Exercise 4
Rohan Gupta
*/

// ------------------------- includes -------------------------
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

// begin main
int main(int argc, char *argv[]) {

    // ------------------- predefined variables -------------------
    char inputChar[50];
    double xmin, ymin, xmax, ymax;
    double hx, hy, vX, vY;
    double omega;

    // input mats
    double xpos[22361];
    double xvel[22361];
    double ypos[22361];
    double yvel[22361];

    // create output mats
    double xVals[130][172];
    double yVals[130][172];

    // --------------------- file management ----------------------
    // attempt to open file & make sure it exists
    FILE *pFile = fopen("PIV.dat","r");
    if (pFile == NULL) {
        return 0, printf("That file doesn't exist!");
    }


    // ------------------------ processing ------------------------
    fgets(inputChar, 50, pFile);
    for (int i = 0; i < 22361; i++) {
        fgets(inputChar, 50, pFile);
        sscanf(inputChar, "%lf %lf %lf %lf [^/n]", &xpos[i], &ypos[i], &xvel[i], &yvel[i]);

        // convert to correct units
        xpos[i] = xpos[i]/1000.0;
        ypos[i] = ypos[i]/1000.0;

        // determine min/max values
        if (xpos[i] < xmin) xmin = xpos[i];
        if (ypos[i] < ymin) ymin = ypos[i];
        if (xpos[i] > xmax) xmax = xpos[i];
        if (ypos[i] > ymax) ymax = ypos[i];
    }

    // calculate spacing
    hx = (xmax-xmin)/171.0;
    hy = (ymax-ymin)/129.0;

    // store values to prep for ex5
    int itr1 = 0;
    for (int r = 0; r < 130; r++) {
        for (int c = 0; c < 172; c++) {
            xVals[r][c] = xvel[itr1];
            yVals[r][c] = yvel[itr1];
            itr1++;
        }
    }

    // ------------------------- outputs --------------------------
    // create file with write perms & create file pointer
    FILE *xOutFile = fopen("Xvel.txt", "w+");
    FILE *yOutFile = fopen("Yvel.txt", "w+");

    // write to file in the requested format (ex 4)
    int itr2 = 1;
    for (int r = 0; r < 130; r++) {
        for (int c = 0; c < 172; c++) {
            fprintf(xOutFile, "%*lf ", 10, xvel[itr2]);
            fprintf(yOutFile, "%*lf ", 9, yvel[itr2]);
            itr2++;
        }
        fprintf(xOutFile, "\n");
        fprintf(yOutFile, "\n");
    }

    // write to file in the requested format (ex 5)
    FILE *vortOut = fopen("Vort.txt", "w+");
    for (int r = 2; r < 128; r++) {
        for (int c = 3; c < 171; c++) {
            // calculate vX & vY
            vX = (-xVals[r+2][c] + 8.0*xVals[r+1][c] - 8.0*xVals[r-1][c] + xVals[r-2][c])/(12.0*hy);
            vY = (-yVals[r][c+2] + 8.0*yVals[r][c+1] - 8.0*yVals[r][c-1] + yVals[r][c-2])/(12.0*hx);

            // calculate omega and write solution to file
            omega = vY-vX;
            fprintf(vortOut, "%*lf ", 12, omega);
        }   
        fprintf(vortOut, "\n");
    }

    // close all files
    fclose(pFile);
    fclose(xOutFile);
    fclose(yOutFile);
    fclose(vortOut);
}