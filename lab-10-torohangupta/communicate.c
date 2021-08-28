/*
AER E 361
Lab 10
Rohan Gupta
*/

#include <stdio.h>
#include <mpi.h>
#include <math.h>

#define TRIALS 100;

int main(int argc, char *argv[]) {
  int i, j, tag = 1;
  int length = 10;
  int trial = 10;
  int *A, *B;
  double *time;
  double t1, t2;
  int n = 1;

  // MPI Initialization
  MPI_Init(&argc, &argv);

  int size;
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  int rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  MPI_Status stat;

  // Allocating memory for A,B,time vector
  // INSERT YOUR CODE HERE FOR ALLOCATING A,B, and time
  A = malloc(length * sizeof(int));
  B = malloc(length * sizeof(int));
  time = malloc(trial * sizeof(double));

  for (j = 0; j < trial; j++) {
    if (rank == 0) {
      for (i = 0; i < length; i++) {
        A[i] = i;
      }
    }
    for (i = 0; i < length; i++) {
      B[i] = rank;
    }
  }

  // Calculating A = A + B on different processor and send value of B back to the root processor.
  int iter;
  for (iter = 0; iter < trial; iter++) {
    MPI_Barrier(MPI_COMM_WORLD);

    if (rank == 0) {
      t1 = MPI_Wtime();

      for (j = 1; j < size; j++) {
        MPI_Send(A, n, MPI_INT, j, tag, MPI_COMM_WORLD);
      };

      // INSERT YOUR MPI_Recv below
      MPI_Recv(B, 1, MPI_INT, 1, tag, MPI_COMM_WORLD, &stat);

      t2 = MPI_Wtime();
      time[iter] = (t2 - t1) * 0.5 * (1e+6);
    }

    if (rank > 0) {
      //INSERT to receive A
      MPI_Recv(A, n, MPI_INT, 0, tag, MPI_COMM_WORLD, &stat);

      for (i = 0; i < length; ++i) {
        A[i] += B[i];
      }

      // Insert code to send A
      MPI_Send(A, 1, MPI_INT, 0, tag, MPI_COMM_WORLD);
    }

    if (rank == 0) {
      for (i = 0; i < length; ++i) {
        printf("A[%d] = %d\n", i, A[i]);
      }
    }

    // Print out average time
    if (rank == 0) {
      printf("number of trial = %d, number of processor used = %d\n", trial, size);
      double sum;
      for (i = 0; i < trial; i++) {
        sum += time[i];
      }
      double average = sum / trial; // in ms
      printf("average time = %lf microsecond\n", average);
    }

    //INSERT code to free up what you did for malloc
    free(A);
    free(B);
    free(time);

    MPI_Finalize();
    return 0;
  }
}