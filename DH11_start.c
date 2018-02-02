#include <wiringPi.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
/* Special thanks to the uugear.com TEAM, that shared this code with the world :) */
#define MAX_TIMINGS	85
#define DHT_PIN		7	/* GPIO-22 */
int lectura = 0;
int data[5] = { 0, 0, 0, 0, 0 };
FILE *fp;  

void read_dht_data()
	
{
       
	uint8_t laststate	= HIGH;
	uint8_t counter		= 0;
	uint8_t j			= 0, i;

	data[0] = data[1] = data[2] = data[3] = data[4] = 0;

	/* pull pin down for 18 milliseconds */
	pinMode( DHT_PIN, OUTPUT );
	digitalWrite( DHT_PIN, LOW );
	delay( 18 );

	/* prepare to read the pin */
	pinMode( DHT_PIN, INPUT );

	/* detect change and read data */
	for ( i = 0; i < MAX_TIMINGS; i++ )
	{
		counter = 0;
		while ( digitalRead( DHT_PIN ) == laststate )
		{
			counter++;
			delayMicroseconds( 1 );
			if ( counter == 255 )
			{
				break;
			}
		}
		laststate = digitalRead( DHT_PIN );

		if ( counter == 255 )
			break;

		/* ignore first 3 transitions */
		if ( (i >= 4) && (i % 2 == 0) )
		{
			/* shove each bit into the storage bytes */
			data[j / 8] <<= 1;
			if ( counter > 16 )
				data[j / 8] |= 1;
			j++;
		}
	}

	/*
	 * check we read 40 bits (8bit x 5 ) + verify checksum in the last byte
	 * print it out if data is good
	 */
	if ( (j >= 40) &&
	     (data[4] == ( (data[0] + data[1] + data[2] + data[3]) & 0xFF) ) )
	{
		lectura += 1;
		float h = (float)((data[0] << 8) + data[1]) / 10;
		if ( h > 100 )
		{
			h = data[0];	// for DHT11
		}
		float c = (float)(((data[2] & 0x7F) << 8) + data[3]) / 10;
		if ( c > 125 )
		{
			c = data[2];	// for DHT11
		}
		if ( data[2] & 0x80 )
		{
			c = -c;
		}
		float f = c * 1.8f + 32;
		fprintf(fp ,"%d %.1f %.1f \n", lectura*5 , h, c );  /**FIX TIME INTERVALS OF READING DATA, and HANDLING GARBAGE DH11 data!!!**/
		fflush(fp);
		printf("\t Humedad: %.1f \t Temperatura: %.1f \n ", h, c);
		
	}else  {

		printf( "Scanning...\n" );
	}
}

int main ()
{
            
	fp = fopen("mydata.dat","w");
	printf( "******* Prototype T-Water-Y ****** Powered by Raspberry Pi - DHT11 ********** \n \t Starting temperature/humidity test\n" )
	if ( wiringPiSetup() == -1 )
		exit( 1 );

	while ( 1 )
	{
		read_dht_data();
		delay( 1000 ); /* wait 1 second before next read */
	}

	return(0);
}
