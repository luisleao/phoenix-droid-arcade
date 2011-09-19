/*******************************************************************************
 * Projeto: Phoenix Arcade - 7seg display controller
 * Descrição: Definições
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

#include "Definitions_Rev00.h"

/*--------------------------- Variáveis Globais ------------------------------*/
 
unsigned char rx[BUFFER_SIZE], rxCount; // Usadas na comunicação serial

// Armazena os scores recebidos em formato BCD
unsigned char scoreA0, scoreA1, scoreA2, scoreA3, scoreB0, scoreB1, scoreB2, scoreB3;
unsigned char display;	