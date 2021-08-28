#include <stdbool.h>
#include "csvparser.h"

int mycsv(bool header, char* parse_file, char* out_file, bool varPrint) {
    FILE * fp;
    fp = fopen(out_file, "w+");

    if (header == true) {
        CsvParser *csvparser = CsvParser_new(parse_file, ",", 1);
        CsvRow *row;
        const CsvRow *header = CsvParser_getHeader(csvparser);

        if (header == NULL) {
            fprintf(fp, "%s,\n", CsvParser_getErrorMessage(csvparser));
            return 1;
        }

        const char **headerFields = CsvParser_getFields(header);
        for (int i = 0 ; i < CsvParser_getNumFields(header) ; i++) {
            fprintf(fp, "%s", headerFields[i]);
        }

        while ((row = CsvParser_getRow(csvparser)) ) {
            fprintf(fp, "\n");
            const char **rowFields = CsvParser_getFields(row);
            for (int i = 0 ; i < CsvParser_getNumFields(row) ; i++) {
                fprintf(fp, "%s,", rowFields[i]);
            }
            fprintf(fp, "\n");
            CsvParser_destroy_row(row);
        }
    
        CsvParser_destroy(csvparser);

    } else {
        CsvParser *csvparser = CsvParser_new(parse_file, ",", 0);
        CsvRow *row;

        while ((row = CsvParser_getRow(csvparser)) ) {
            fprintf(fp, "\n");

            const char **rowFields = CsvParser_getFields(row);
            for (int i = 0 ; i < CsvParser_getNumFields(row) ; i++) {
                fprintf(fp, "%s,", rowFields[i]);
            }
            fprintf(fp, "\n");
            CsvParser_destroy_row(row);
        }
        CsvParser_destroy(csvparser);
    }

    return 0;
}