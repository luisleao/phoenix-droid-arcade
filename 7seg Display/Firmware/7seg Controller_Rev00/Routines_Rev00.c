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

#include "Routines_Rev00.h"

/*******************************************************************************
 * Nome: init
 * Descrição: Configura��es gerais do uC
 * Notas: 
*******************************************************************************/
void init(void)
{
	// Configura dire��o das portas
	TRISA = 0;
	TRISB = 0;
	TRISC = 0;
	
	// Configura pinos anal�gicos como digitais
	CMCON = 7;
	ADCON1 = 7;
	
	nRBPU = 1; // Pull-ups da porta B desativados
	
	PEIE = 1;	// Habilita interrup��o de perif�ricos
	GIE = 1;	// Habilita interrup��es globais
	
} // init


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
	TXEN = 1;	// Transmission enabled
	SYNC = 0;	// Asynchronous mode
	BRGH = 1;	// Low speed
                // Não alterar, do contrário a fármula de cálculo do BRGVAL
                // não irá funcionar.

	// Registrador RCSTA
	SPEN = 1;	// Serial port enabled
	RX9  = 0;	// Selects 8-bit reception
	FERR = 0;	// No framing error
	OERR = 0;	// No overrun error
	CREN = 1;	// Enables continuos receive

	SPBRG = BRGVALU1; // Baud rate
	
	RCIF = 0;	// Limpa o flag da interrup��o
	RCIE = 1;	// Habilita interrupção do RX
} // initUART


/*******************************************************************************
 * Nome: initTimer2
 * Descrição: Configura a Timer2
 * Notas: 
*******************************************************************************/
void initTMR2(void)
{
	// Prescaler 1:16
	T2CKPS1 = 0;
	T2CKPS0 = 0;
	
	// Postscaler 1:16
	TOUTPS3 = 0;
	TOUTPS2 = 1;
	TOUTPS1 = 0;
	TOUTPS0 = 0;
	
	TMR2IF = 0;
	TMR2IE = 1;	// Habilita interrup��o do Timer2	
	
//	PR2 = 0xff;
} // initTMR2

///*******************************************************************************
//  NOME: putU1
//  DESCRI��O: Envia dado pela UART1
//  RETORNO: Dado
//  ALGORITIMO:  nenhum
//  NOTAS:  nenhum
//*******************************************************************************/
//int putU1(int c)
//{
//   //while(CTS);            // Wait for !CTS, Clear To Send
//   while(!TXIF);	// Wait while TX buffer full
//   TXREG = c;   
//   return c;   
//} // putU1

///*******************************************************************************
//  NOME: putsU1
//  DESCRI��O: Envia string pela UART1
//  RETORNO: Dado
//  ALGORITIMO:  nenhum
//  NOTAS:  Utiliza fun��o putU1
//*******************************************************************************/
//int putsU1(int *s)
//{
//   while(*s != '\0') // Loop at� *s== '\0', final da string
//   {
//      putU1(*s++);   // Envia um caracter e aponta para o pr�ximo
//   }
//} // putsU1
