#include "lesson1.h"

#define F_CPU 16000000
#define LED PD4  // Change LED to be PD4

int main(void) {
    DDRD |= (1 << LED);  // Configure PORTB0 (PD4) as output 
    
    PORTD |= (1 << LED); // Set PD4 high (LED on)

    while(1) {
        // Your code here (this loop will run indefinitely)
    }

    return 0;
}
