/* Created by Zoltan Marcsek 08.04.2021 */
/*
 * CLK frequency: 8MHz
 * 
 * Timer0:  interrupt every 20ms, start Timer1
 *          div=1024;clk=7.8125kHz;Cycles=156
 * 
 * Timer1:  single shot, 1-2ms impulse
 *          div=64;clk=125kHz;Cycles=125..250
 * 
 * ADC:     f_s=~4.6kHz
 *          exp. avg. filter:
 *              f_0=615Hz
 *              alpha = 0.875 (7/8)
 */

#include <avr/interrupt.h>

#define TC1_PRESCALER 0b0111 // Divide by 64
volatile uint8_t tim1_cmp = 255;

int main()
{
    DDRB = (1 << 4) | (1 << 2);
    // ADC setup:
    ADMUX = 0b0011 | (1 << ADLAR); // input: PB3, left adjust, ref:VCC
    ADCSRA = (1 << ADIE) | 0b111;  // clk=62.5kHz, complete IT
    DIDR0 = (1 << 3);              // disable PB3 DIN
    ADCSRA |= (1 << ADEN);         // enable

    // Timer0 setup:
    TCCR0A = 0b10;          // CTC mode
    TCCR0B = 0b101;         // prescaler=1024
    OCR0A = 155;            // Reset at 155
    TIMSK |= (1 << OCIE0A); // Enable cmpA IT

    // Timer1 setup:
    OCR1A = tim1_cmp;
    TIMSK |= (1 << OCIE1A); // enable cmpA IT
    PLLCSR = 0;

    ADCSRA |= (1 << ADSC); // trigger ADC
    sei();

    while (1)
    {
    }
}

ISR(TIMER0_COMPA_vect)
{
    cli();
    TCCR1 |= TC1_PRESCALER; // start Timer1
    PORTB |= (1 << 4);      // output ON
    sei();
}

ISR(TIMER1_COMPA_vect)
{
    cli();
    TCCR1 &= 0xF0;      // stop timer1
    TCNT1 = 0;          // clear
    PORTB &= ~(1 << 4); // output OFF
    OCR1A = tim1_cmp;   // set compare value
    sei();
}

ISR(ADC_vect)
{
    cli();
    uint8_t new = (ADCH >> 1) | (1 << 7);      // adc value -> 128..255
    uint16_t temp = (7 * new + tim1_cmp) >> 3; // filter f_0=615Hz
    tim1_cmp = temp;
    PORTB ^= (1 << 2);
    ADCSRA |= (1 << ADSC); // trigger ADC
    sei();
}