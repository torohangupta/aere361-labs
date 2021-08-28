/*
AerE 361
Lab 5
Exercise 1
Rohan Gupta
*/

// ------------------------- includes -------------------------
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

//  ------------------------ functions ------------------------
void arrGen(float arry[], int arraySize) {
	for (int i = 0; i < arraySize; i++) {
		arry[i] = 1.0 + pow(i, 2.0) + (1.0/3.0)*pow(i, 3.0);
	}
}

//  ---------------------- main function ----------------------
int main(int argc, char ** argv) {
	// ------------------- predefined variables -------------------
	int arrSize, reqElem;
	char filename[7] = "ans.out";
	FILE *pFile;

	if (argc > 1) {
        // ------------------- autograder input -------------------
		arrSize = atoi(argv[1]);
		reqElem = atoi(argv[2]);

	} else {
        // ---------------------- user input ----------------------
		printf("Please enter the size of the array you want\n(Please list an integer greater than 0 and less/equal to 250): ");
        scanf("%d", &arrSize);
		if (arrSize < 1 || arrSize > 250) {
			return 0, printf("Invalid size.");
		}
		printf("Please enter the the element for which you want the value of: ");
        scanf("%d", &reqElem);

	}

// ------------------------- outputs -------------------------
	float arry[arrSize];
	arrGen(arry, arrSize);

	if (reqElem > 0 && reqElem <= arrSize) {
		float elem = arry[reqElem-1];
		printf("Your number is: %f\n", elem);

		// save value to file & then close the file
		pFile = fopen(filename, "w+");
		for (int i = 0; i < reqElem; i++) {
			fprintf(pFile, "%.5f\n", arry[i]);
		}
		fclose(pFile);
		return 0;

	} else {
		return 0, printf("Your requested element input was invalid!");
	}
}
