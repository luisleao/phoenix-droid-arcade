/*******************************************************************************
 * Projeto: Phoenix Arcade - 7seg display controller
 * Descrição: Header - Definições
 * Microcontrolador: PIC16F876A
 * Compilador: HI-TECH C 9.82
 * Autor: Igor Pereira Peixoto
 -------------------------------------------------------------------------------
 * Versão - Autor - Mudanças
 -------------------------------------------------------------------------------
 * 0.0 - Igor Peixoto - Initial issue
 *
 ******************************************************************************/

/*-------------------------------- Headers -----------------------------------*/

#include <htc.h>


/*------------------------------ Constantes ----------------------------------*/
#define BRGVALU1    64          // Baud rate da UART (FOSC/(16*baudrate)) - 1

#define BUFFER_SIZE 6           // Tamanho da mensagem

/*--------------------------- Variáveis Globais ------------------------------*/

extern unsigned char rx[BUFFER_SIZE], rxCount;  // Usadas na comunicação serial
extern unsigned char scoreA0, scoreA1, scoreA2, scoreA3, scoreB0, scoreB1, scoreB2, scoreB3;
extern unsigned char display;	

/*-------------------------------- Pinagem -----------------------------------*/

// Segmentos
// 0 -> liga segmento ; 1 -> desliga segmento
#define segA    RA0
#define segB    RA1
#define segC    RA2
#define segD    RA3 
#define segE    RB7 //RA4
#define segF    RA5
#define segG    RB5 //RC0

// Colunas
// 0 -> desliga coluna ; 1 -> liga coluna
// Display 1 - Score
#define colA0  RB6
#define colA1  RC0 //RB5
#define colA2  RB4
#define colA3  RB3
#define colA4  RB2
#define colA5  RB1

// Display 2 - Hi-Score
#define colB0  RB0
#define colB1  RC5
#define colB2  RC4
#define colB3  RC3
#define colB4  RC2
#define colB5  RC1
