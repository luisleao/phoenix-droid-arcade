/*******************************************************************************
 * Projeto: Phoenix Arcade - 7seg display controller
 * Descrição: Header - Comunicação
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
#include "Definitions_Rev00.h"

/*------------------------------- Protótipos ---------------------------------*/
void init(void);			// Configura��es gerais do uC
void initUART(void);        // Configura UART1
void initTMR2(void);		// Configura Timer2
//int putU1(int c)						// Envia um byte pela UART1
//int putsU1(int *s)						// Envia string pela UART1