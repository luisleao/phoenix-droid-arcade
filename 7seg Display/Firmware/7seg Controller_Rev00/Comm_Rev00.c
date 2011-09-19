/*******************************************************************************
 * Projeto: Phoenix Arcade - 7seg display controller
 * Descrição: Comunicação
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

#include "Comm_Rev00.h"


/*******************************************************************************
 * Nome: initUART
 * Descrição: Configura a UART1
 * Notas: Se o valor do oscilador for trocado ou o PLL alterado atualizar a
          constante FOSC em "Definitions_RevXX.h" com o novo valor
*******************************************************************************/
void initUART(void)
{
 	// Configura registradores da UART1 ----------------------------------------
	// Registrador TXSTA
	TX9  = 0;	// 8-bit transmission
	TXEN = 0;	// Transmission disabled
	SYNC = 0;	// Asynchronous mode
	BRGH = 1;	// High speed
                        // Não alterar, do contrário a fármula de cálculo do BRGVAL
                        // não irá funcionar.

	// Registrador RCSTA
	SPEN = 1;	// Serial port enabled
	RX9  = 0;	// Selects 8-bit reception
	CREN = 1;	// Enables continuos receive
	FERR = 0;	// No framing error
	OERR = 0;	// No overrun error

	SPBRG = BRGVALU1;

	RCIE = 1;	// Habilita interrupção do RX
} // initUART
