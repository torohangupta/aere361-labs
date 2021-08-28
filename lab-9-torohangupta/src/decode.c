/*AerE 361 Lab 9


The following code is based on the SDK provided by Dynastream Innovations
This template file is given to students to complete their lab
*/

////////////////////////////////////////////////////////////////////////////////
// The following FIT Protocol software provided may be used with FIT protocol
// devices only and remains the copyrighted property of Dynastream Innovations Inc.
// The software is being provided on an "as-is" basis and as an accommodation,
// and therefore all warranties, representations, or guarantees of any kind
// (whether express, implied or statutory) including, without limitation,
// warranties of merchantability, non-infringement, or fitness for a particular
// purpose, are specifically disclaimed.
//
// Copyright 2008 Dynastream Innovations Inc.
////////////////////////////////////////////////////////////////////////////////

//DEFINES
#define _CRT_SECURE_NO_WARNINGS
//INCLUDES
#include "stdio.h"
#include "string.h"
#include "math.h"
#include "../include/fit_convert.h"

//MAIN FUNCTION

int main(int argc, char* argv[])
{
    //VARIABLES AND CONSTANTS
    //File pointer for opening our file
    FILE* file;
    //File pointer for our file used for writting data to
    FILE* fp = NULL;
    FILE* fp2 = NULL;
    //The following is used by the SDK for handling the file buffers, DO NOT MODIFY
    FIT_UINT8 buf[8];
    FIT_CONVERT_RETURN convert_return = FIT_CONVERT_CONTINUE;
    FIT_UINT32 buf_size;
    FIT_UINT32 mesg_index = 0;

    // Variables used for data retrieval and calculations
    double gps_heading, altitude, speed, lat, lon = 0.0;
    double pitch_data, roll_data, turn_data = 0.0;

    // First thing, create a new file for us to use to write to
    // Call this file aircraft_log.txt
    // HINT - We want a new file created everytime we run this program


	// The following is code used by the SDK - DO NOT MODIFY
	#if defined(FIT_CONVERT_MULTI_THREAD)
    		FIT_CONVERT_STATE state;
	#endif

    if (argc < 2)
    {
        printf("usage: decode.exe <fit file>");
        return FIT_FALSE;
    }

    printf("Testing file conversion using %s file...\n", argv[1]);

	#if defined(FIT_CONVERT_MULTI_THREAD)
    		FitConvert_Init(&state, FIT_TRUE);
	#else
    		FitConvert_Init(FIT_TRUE);
	#endif

    if ((file = fopen(argv[1], "rb")) == NULL)
    {
        printf("Error opening file %s.\n", argv[1]);
        return FIT_FALSE;
    }
    // printf("Processing...\n");
    while (!feof(file) && (convert_return == FIT_CONVERT_CONTINUE))
    {
        for (buf_size = 0; (buf_size < sizeof(buf)) && !feof(file); buf_size++)
        {
            buf[buf_size] = (FIT_UINT8)getc(file);
        }

        do
        {
            #if defined(FIT_CONVERT_MULTI_THREAD)
            	convert_return = FitConvert_Read(&state, buf, buf_size);
            #else
            	convert_return = FitConvert_Read(buf, buf_size);
            #endif

            switch (convert_return)
            {
            case FIT_CONVERT_MESSAGE_AVAILABLE:
            {
                #if defined(FIT_CONVERT_MULTI_THREAD)
                	const FIT_UINT8* mesg = FitConvert_GetMessageData(&state);
                	FIT_UINT16 mesg_num = FitConvert_GetMessageNumber(&state);
                #else
                	const FIT_UINT8* mesg = FitConvert_GetMessageData();
                	FIT_UINT16 mesg_num = FitConvert_GetMessageNumber();
                #endif
                // printf("Processing Message # (ID): %d (%d) \n", mesg_index++, mesg_num);
                // Here we will begin changing code, look for hints below.
                switch (mesg_num)
                {
                	case FIT_MESG_NUM_FILE_ID:
                	{
                    		const FIT_FILE_ID_MESG* id = (FIT_FILE_ID_MESG*)mesg;
                    		printf("File ID: type=%u, number=%u\n", id->type, id->number);
                    		break;
                	}

                	case FIT_MESG_NUM_AVIATION_ATTITUDE:
                	{
                		fp2 = fopen("attitude_log.txt", "a");
                		const FIT_AVIATION_ATTITUDE_MESG* attitude = (FIT_AVIATION_ATTITUDE_MESG*)mesg;
                		roll_data = ((attitude->roll[0]) / 10430.38) * (180.0 / 3.14);
                        pitch_data = ((attitude->pitch[0]) / 10430.38) * (180.0 / 3.14);
                        turn_data = ((attitude->turn_rate[0]) / 1024.0) * (180.0 / 3.14);

                        fprintf(fp2, "%d\t %0.2f\t %0.2f\t %0.2f\t \n", mesg_index,pitch_data, roll_data, turn_data);
                		//Write the rest of the program here. Don't forget to write
                    //this to the file and to close the file when you are done.
                        fclose(fp2);
                		break;
                	}
                	/* The Data we will work with is in our GPS MetaData.  Everytime we come across
                	 * a header with FIT_MESG_NUM_GPS_METADATA we want to work with the data found
                	 * in there.  Here, we will extract our data and also append the data to our data
                	 * file we created.
                	 */
                	case FIT_MESG_NUM_GPS_METADATA:
                	{
                    		// Open the file again, but now we wish to append to it
                			// STUDENT - Write code below to open your data file
                            fp = fopen("gps_log.txt", "a");
                			// Make sure you set it to append.
                    		//This points to our MESG data that we want
                    		const FIT_GPS_METADATA_MESG* gps = (FIT_GPS_METADATA_MESG*)mesg;

                    		//First, let's extract our latitude and longitude, see the lab manual on how we do this
                    		//and how we convert this to decimal degrees
                            // gps_heading, altitude, speed, lat, lon = 0.0;
                            lat = (gps->position_lat)*(180.0/pow(2,31));
                            lon = (gps->position_long)*(180.0/pow(2,31));

                            gps_heading = ((gps->heading) / 100.0);
                            altitude = (((gps->enhanced_altitude)/5)- 500.0)*3.28;
                            speed = (gps->enhanced_speed)*(1.944/1000.0);
                    		//Obtain our altitude and convert to feet, again, you can reference the lab
                    		//manual on how we do the conversion.


                    		//Obtain the speed collected, convert to knots

                    		//printf("Velocity %d \n",gps->velocity[1]);
                    		//speed = gps->velocity[1];

                    		//Finally, let's get our heading information.  Again, refer to the lab manual


                    		// Not all of our data is good data.  At times, the GPS does not have data
                    		// Write an IF statement that will help you filter out this "bad" data so it is not
                    		// in our data file.  One method is to filter out all data that has a really
                    		// high altitude value.  Our plane is never going to go above 40,000 ft, so
                    		// we could use that value to filter out. So write something here that will
                            if (altitude < 40000.0) { 
                                fprintf(fp, "%d\t %0.8f\t %0.8f\t %0.2f\t %0.2f %0.2f\n", mesg_index,lon, lat, altitude, speed,gps_heading);
                            }
                        // only write the data to file if those conditions are met.

                    	// We are now done and to be safe, we will now close our file
                    	fclose(fp);
                    	break;

                	}
                  /*
                  * The rest of this should not be touched. At this point you are done.
                  */
                	case FIT_MESG_NUM_SESSION:
                	{

                    		const FIT_SESSION_MESG* session = (FIT_SESSION_MESG*)mesg;
                    		printf("Session: timestamp=%u\n", session->timestamp);
                    		break;
                	}

                	case FIT_MESG_NUM_EVENT:
                	{
                    		const FIT_EVENT_MESG* event = (FIT_EVENT_MESG*)mesg;
                    		printf("Event: timestamp=%u\n", event->timestamp);
                    		break;
                	}

                default:
                    // printf("Unknown\n");
                    break;
                }
                break;
            }

            default:
                break;
            }
        } while (convert_return == FIT_CONVERT_MESSAGE_AVAILABLE);
    }
    // Again, things the SDK uses to handle some errors, DO NOT MODIFY
    if (convert_return == FIT_CONVERT_ERROR)
    {
        printf("Error decoding file.\n");
        fclose(file);
        return 1;
    }

    if (convert_return == FIT_CONVERT_CONTINUE)
    {
        printf("Unexpected end of file.\n");
        fclose(file);
        return 1;
    }

    if (convert_return == FIT_CONVERT_DATA_TYPE_NOT_SUPPORTED)
    {
        printf("File is not FIT.\n");
        fclose(file);
        return 1;
    }

    if (convert_return == FIT_CONVERT_PROTOCOL_VERSION_NOT_SUPPORTED)
    {
        printf("Protocol version not supported.\n");
        fclose(file);
        return 1;
    }

    if (convert_return == FIT_CONVERT_END_OF_FILE)
        printf("File converted successfully.\n");

// At this point we want to close file we read from
    fclose(file);

    return 0;
}
