/* Created by Zoltan Marcsek 08.04.2021 */
/*
 * PB3 - Potentiometer input
 * PB4 - PWM output
 * PB2 - Enable input
 */

#define ENABLE_ACTIVE_LOW 0 // Set to 0 for active high, 1 for active low
#define POT_MINIMUM 0       // Scale: 0..255
#define POT_MAXIMUM 255     // Scale: 0..255

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

/*
 * If enabled:
 * PB0 will change state when a new PWM period starts
 * PB1 will change state when a new ADC sample is taken
 */
//#define DEBUG_SIGNALS

#define TC1_PRESCALER 0b0111 // Divide by 64
volatile uint8_t tim1_cmp = 255;

int main()
{
    DDRB = (1 << 4);
#ifdef DEBUG_SIGNALS
    DDRB |= (1 << 0) | (1 << 1);
#endif
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
    uint8_t in = ((PINB >> 2) & 0x01) ^ ENABLE_ACTIVE_LOW;
    PORTB |= (in << 4); // output ON
#ifdef DEBUG_SIGNALS
    PORTB ^= (1 << 0);
#endif
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
    uint8_t adc_scaled = ((uint16_t)(ADCH - POT_MINIMUM) * 255) / (POT_MAXIMUM - POT_MINIMUM);
    uint8_t new = (adc_scaled >> 1) | (1 << 7); // adc value -> 128..255
    uint16_t temp = (7 * new + tim1_cmp) >> 3;  // filter f_0=615Hz
    tim1_cmp = temp;
    ADCSRA |= (1 << ADSC); // trigger ADC
#ifdef DEBUG_SIGNALS
    PORTB ^= (1 << 1);
#endif
    sei();
}