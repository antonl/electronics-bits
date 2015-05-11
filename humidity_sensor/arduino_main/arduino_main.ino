#include <avr/io.h>
#include <avr/interrupt.h>
#include <Wire.h> //I2C library

/*
 * inspired by Peter H Anderson, http://www.phanderson.com/arduino/hih6130.html
 */

uint8_t SENSOR_PIN = 4;
uint8_t SENSOR_ADDRESS = 0x27;
uint8_t DATA_LENGTH = 4;
uint8_t LED_PIN = 13;

typedef enum {READING = 0, REQUESTING = 1, SENDING = 2} state_t;
volatile state_t current_state, next_state;

uint8_t data[4];
uint8_t status;
uint16_t humidity, temperature;

void setup(void)
{
    // use timer1 for 1 Hz measurement
    noInterrupts();
    TCCR1A = TCCR1B = TCNT1 = 0; // clear timer1 registers
    OCR1A = 62500; // 2^16 - 3036
    OCR1B = 50000; // 0.8 s 
    OCR1C = 56250; // 0.9 s
    TCCR1B |= (1<<WGM12); // CTC mode
    TIMSK1 |= (1 << OCIE1A); // enable output compare match interrupt
    TIMSK1 |= (1 << OCIE1B); // enable output compare match interrupt
    TIMSK1 |= (1 << OCIE1C); // enable output compare match interrupt
    TIMSK0 &= ~(1 << TOIE0); // disable timer0 overflow interrupt
    interrupts();

    Serial.begin(9600);
    Wire.begin();
    pinMode(SENSOR_PIN, OUTPUT);
    digitalWrite(4, HIGH); // this turns on the HIH3610
    delay(20); // delay 20 ms

    // enable timer1
    TCCR1B |= (1 << CS12); // CLK/256 prescaler
}

inline void handle_request() {
    digitalWrite(LED_PIN, LOW);
    Wire.beginTransmission(SENSOR_ADDRESS);
    Wire.endTransmission();
}

inline void handle_read() {
    Wire.requestFrom(SENSOR_ADDRESS, DATA_LENGTH); // Read 4 bytes
    data[0] = Wire.read();
    data[1] = Wire.read();
    data[2] = Wire.read();
    data[3] = Wire.read();
    Wire.endTransmission();

    // Read status bits and temperature
    status = (data[0] >> 6) & 0x03;
    humidity = ((data[0] & 0x3f) << 8) | data[1];
    temperature = ((data[2] << 8) | data[3]) >> 2;
}

inline void handle_send() {
    digitalWrite(LED_PIN, HIGH);

    Serial.print(status);
    Serial.write(',');
    Serial.print(humidity);
    Serial.print(',');
    Serial.print(temperature);
    Serial.print('\n');
}

void loop(void)
{
    if(current_state == next_state) return;
    
    // perform transition event
    switch(current_state) {
        case READING: handle_read(); break;
        case REQUESTING: handle_request(); break;
        case SENDING: handle_send(); break;
    }
    current_state = next_state;
}

ISR(TIMER1_COMPB_vect) {
    // 0.8 s into the timer period, request measurement
    next_state = REQUESTING;
}

ISR(TIMER1_COMPC_vect) {
    // 0.9 s into timer period, read response
    next_state = READING;
}

ISR(TIMER1_COMPA_vect) {
    // 1s into the timer period, send data
    next_state = SENDING;
}

