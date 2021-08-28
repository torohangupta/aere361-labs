#include <stdio.h>
#include <string.h>
#include <mpi.h>

int  main(int argc , char* argv []) {
    int  rank;  // rank of processors
    int p;      // number of processors

    // Start up MPI
    MPI_Init(&argc , &argv);

    // Find out processor rank
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    printf("Hello world from processor %d!\n", rank);

    // Shut down MPI 
    MPI_Finalize();
    return 0;
}