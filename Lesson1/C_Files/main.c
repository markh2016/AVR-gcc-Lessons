#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 16000000
#define LED PD4  // Change LED to be PB0

int main(void) {
    DDRD |= (1 << LED);  // Configure PORTB0 (PB0) as output instead of PORTD4
    
    PORTD |= (1 << LED); // Set PB0 high (LED on)

    while(1) {
        // Your code here (this loop will run indefinitely)
    }

    return 0;
}
