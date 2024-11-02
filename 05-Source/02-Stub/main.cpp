
#include "BSW_cfg.h"

#ifdef MINGW_TEST

#include <stdio.h>
#include <stdlib.h>

#include <iostream>
#include <cstdlib>

#include "CSWC_int.hpp"

// using namespace std;



int C_Var = 0 ;
int CPP_Var = 0 ;

int main(void)
{


	scanf("%d", &C_Var) ;

	for (int i=0;i<C_Var;i++)
	{
		printf ("hello C Programming! %d  \n",C_Var) ;
	}


	std::cin >> CPP_Var ;

	for (int i=0;i<CPP_Var;i++)
	{
		std::cout<<"hello C++ Programming! "<<CPP_Var<< "  "<<std::endl;
	}



	std::system("pause\n");  // Pause program to see the output (Windows)


	// while(1) ;

	return 0;
}




#endif 








#ifdef AVR_TEST




#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN PB0  // Define the LED pin connected to PB0

int main(void) {
    // Set PB0 as output
    DDRB |= (1 << LED_PIN);  // Set Direction Register for PORTB

    // Main loop
    while (1) {
        // Toggle the LED on
        PORTB |= (1 << LED_PIN);  // Set PB0 high
        _delay_ms(500);           // Delay for 500 milliseconds

        // Toggle the LED off
        PORTB &= ~(1 << LED_PIN); // Set PB0 low
        _delay_ms(500);           // Delay for 500 milliseconds
    }

    return 0; // This line will never be reached
}



#endif 