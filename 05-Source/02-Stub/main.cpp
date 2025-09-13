
#include "BSW_cfg.h"

#ifdef MINGW_TEST

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <iostream>
#include <cstdlib>

#include "CSWC_int.hpp"


#include <vector>
#include <string>
#include <stdbool.h>

#include <ctype.h>





int main(int argc,int *argv[])
{

    std::cout << "All is working fined" <<std::endl ;


	return false;
}




#endif 








#ifdef AVR_TEST


#define F_CPU 8000000UL
#define __AVR_ATmega325P__ 

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













#ifdef ARM_TEST

#include <stdio.h>
#include <stdlib.h>



#define LED_PIN PB0  // Define the LED pin connected to PB0

int main(void) {

    // Main loop
    while (1) {

    }

    return 0; // This line will never be reached
}



#endif 