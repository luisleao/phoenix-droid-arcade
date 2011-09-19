/*******************************************************************************
 * Projeto: Phoenix Arcade - 7seg display controller
 * Descri√ß√£o: Main file
 * Microcontrolador: PIC16F876A
 * Compilador: HI-TECH C 9.82
 * Autor: Igor Pereira Peixoto
 -------------------------------------------------------------------------------
 * Vers√£o - Autor - Mudan√ßas
 -------------------------------------------------------------------------------
 * 0.0 - Igor Peixoto - Initial issue
 *
 ******************************************************************************/

/*-------------------------------- Headers -----------------------------------*/

#include "7seg_Rev00.h"

/*--------------------------- Configuration bits -----------------------------*/

// HS oscillator, Watchdog Timer Disabled, Power-up Timer Enabled,
// Brow-out Reset Enabled, Low-Voltage Programming Disabled,
// Data EEPROM memory code protection off, Flash memory write protection off,
// In-Circuit Debugger off, Flash memory code protection off
__CONFIG( FOSC_HS & WDTE_OFF & PWRTE_ON & BOREN_ON & LVP_OFF & CPD_OFF & WRT_OFF & DEBUG_OFF & CP_OFF );

/*******************************************************************************
 * Nome: main
 * Descri√ß√£o: Fun√ß√£o principal
 * Notas: nenhum
 ******************************************************************************/
int main(void)
{
    //Declara√ß√£o de vari√°veis --------------------------------------------------
	static unsigned char rxOld = 255;	// Vari·vel de comparaÁ„o da comunicaÁ„o serial

    // Rotinas de configura√ß√£o -------------------------------------------------
	init();			// ConfiguraÁıes de porta, etc
	initTMR2();		// Configura Timer2
	initUART();		// Configura porta serial
	
	// Desliga as colunas
 	colA0 = 1;
 	colA1 = 0;
 	colA2 = 0;
 	colA3 = 0;
 	colA4 = 0;
 	colA5 = 0;
 	
 	colB0 = 0;
 	colB1 = 0;
 	colB2 = 0;
 	colB3 = 0;
 	colB4 = 0;
 	colB5 = 0;
	
	// Desliga os segmentos
	segA = 1;
	segB = 1;
	segC = 1;
	segD = 1;
	segE = 1;
	segF = 1;
	segG = 1;
	
	// etc
	display = 0;
	
	// Scores
	scoreA0 = 0;
	scoreA1 = 0;
	scoreA2 = 0;
	scoreA3 = 0;
	scoreB0 = 0;
	scoreB1 = 0;
	scoreB2 = 0;
	scoreB3 = 0;
	
	TMR2 = 0;	// Zera o Timer2
	TMR2ON = 1;	// Habilita o Timer2
	
	unsigned int teste = 0;
	unsigned char string[]={'@','T','E','S','T','E'};
	unsigned char i = 0;
	
    // Rotina principal --------------------------------------------------------
    while(1)
    {	   
	    
	    if(teste < 20000)
	    {
		    teste++;
		}
		else
		{
			for(i=0;i<6;i++)
			{
				/* output one byte */
				while(!TXIF)	/* set when register is empty */
					continue;
				TXREG = string[i];
			}
			teste = 0;		
		}
	     
	    /* Protocolo 
	    // Header  -> @ // Marca o inicio da mensagem, modo assÌncrono
	    // Comando -> D // Desliga os displays
	    		   -> L	// Liga os displays
	    		   -> Z // Zera os displays
	    		   -> A // atualiza o display A
	    		   -> B // atualiza o display B
	    */				    
	    
	    // Verifica se recebeu um comando novo
	    if(rxOld != rx[1])
	    {
		    rxOld = rx[1];	// Atualiza a vari·vel de comaparaÁ„o
		    // Verifica qual o tipo de comando recebido
		    switch(rx[1])
		    {
			    case 'D':
			    	TMR2ON = 0; // Desliga o Timer2
			    	// Apaga os displays
			    	colA0 = 0;
			    	colA1 = 0;
			    	colA2 = 0;
			    	colA3 = 0;
			    	colA4 = 0;
			    	colA5 = 0;
			    	colB0 = 0;
			    	colB1 = 0;
			    	colB2 = 0;
			    	colB3 = 0;
			    	colB4 = 0;
			    	colB5 = 0;		    
			    	break;
			    case 'L':
			    	TMR2 = 0;	// Zera o Timer2
			    	TMR2ON = 1; // Liga o Timer2
			    	break;
			    case 'Z':
			    	scoreA0 = 0;
			    	scoreA1 = 0;
			    	scoreA2 = 0;
			    	scoreA3 = 0;
			    	scoreB0 = 0;
			    	scoreB1 = 0;
			    	scoreB2 = 0;
			    	scoreB3 = 0;
			    	break;
			    case 'A':
			    	scoreA3 = rx[2];
			    	scoreA2 = rx[3];
			    	scoreA1 = rx[4];
			    	scoreA0 = rx[5];
			    	break;
			    case 'B':
			    	scoreB3 = rx[2];
			    	scoreB2 = rx[3];
			    	scoreB1 = rx[4];
			    	scoreB0 = rx[5];
			    	break;
			    default:
			    	break;
			}
		}	
	}
} // main

