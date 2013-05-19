/*
 * EVSE
 *
 * Copyright (C) Jorge Pinto aka Casainho, 2013.
 *
 *   casainho [at] gmail [dot] com
 *     www.casainho.net
 *
 * Released under the GPL License, Version 3
 */

#include <stdint.h>
#include "stm32f10x.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_dac.h"
#include "core_cm3.h"
#include "gpio.h"
#include "adc.h"
#include "pwm.h"
#include "config.h"

// ADC 1978 --> 9V
#define ADC_STEPS_PER_VOLT 220 //(0.187 / 0.0008) //3.3V / 2^12 = 0.0008; voltage divider = 0.18
#define STATE_A_VMAX (13 * ADC_STEPS_PER_VOLT)
#define STATE_A_VMIN (11 * ADC_STEPS_PER_VOLT)
#define STATE_B_VMAX (10 * ADC_STEPS_PER_VOLT)
#define STATE_B_VMIN (8 * ADC_STEPS_PER_VOLT)
#define STATE_C_VMAX (7 * ADC_STEPS_PER_VOLT)
#define STATE_C_VMIN (5 * ADC_STEPS_PER_VOLT)

#define STATE_A 1
#define STATE_B 2
#define STATE_C 3
#define STATE_ERROR 0

#define PILOT_ON GPIO_ResetBits(GPIOA, GPIO_Pin_8)
#define PILOT_OFF GPIO_SetBits(GPIOA, GPIO_Pin_8)
#define LED_ON GPIO_SetBits(GPIOB, GPIO_Pin_5)
#define LED_OFF GPIO_ResetBits(GPIOB, GPIO_Pin_5)

volatile int ev_state = STATE_A;

void manage_led (void)
{
  static int c = 1;

  switch (ev_state)
  {
    // led always on
    case STATE_A:
    LED_ON;
    break;

    // 1Hz led flash
    case STATE_B:
    c++;
    if (c == 4000) // 200ms
    {
      LED_OFF;
    } else if (c > 40000) // 500s
    {
      LED_ON;
      c = 1;
    }
    break;

    // 10Hz led flash
    case STATE_C:
    c++;
    if (c == 2000) // 50ms
    {
      LED_OFF;
    } else if (c > 4000) // 100ms
    {
      LED_ON;
      c = 1;
    }
    break;

    // led always off
    default:
    LED_OFF;
    break;
  }
}

void manage_ev_state (void)
{
  static int value = 2640*100;

  //value = (((value * 99) + adc_get_value ()) / 100);
  value = adc_get_value ();

  if (value > STATE_A_VMIN)
  {
    ev_state = STATE_A;
  }
  else if (value > STATE_B_VMIN)
  {
    ev_state = STATE_B;
  }
  else if (value > STATE_C_VMIN)
  {
    ev_state = STATE_C;
  }
  else
  {
    //ev_state = STATE_ERROR;
  }

  //ev_state = STATE_B;
}

void manage_cp (void)
{
  static int c = 0;

  c++;
  if (c == 1) // 1*25us = 25us --> half of the on time of pilot signal
  {
    // find current EV state
    manage_ev_state ();
  }

  if (c == 2) // 2*25us = 50us, 5% pilot signal on time
  {
    // disable pilot only if EV state is != STATE_A
    if (ev_state != STATE_A)
    {
      PILOT_OFF;
    }
  }

  if (c == 40) // 1ms --> 1kHz pilot signal
  {
    c = 0;

    // enable pilot only if EV state is != STATE_ERROR;
    if (ev_state != STATE_ERROR)
    {
      PILOT_ON;
    }
  }
}

void SysTick_Handler(void)
{
  manage_cp ();

  manage_led ();
}

void initialize (void)
{
  gpio_init ();
  adc_init ();

  /* Setup SysTick Timer for 25us interrupts, also enables Systick and Systick-Interrupt */
  if (SysTick_Config(600))
  {
    /* Capture error */
    while (1);
  }
}

int main (void)
{
  initialize ();

  while (1)
  {

  }
  // should never arrive here
  return 0;
}
