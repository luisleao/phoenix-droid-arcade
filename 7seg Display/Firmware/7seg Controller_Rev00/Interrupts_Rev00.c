/*******************************************************************************
 * Projeto: Phoenix Arcade - 7seg display controller
 * Descrição: Interrupções
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

#include "Interrupts_Rev00.h"


/*******************************************************************************
 * Nome: isr
 * Descrição: Rotinas de interrupção
 * Notas: nenhum
 ******************************************************************************/
interrupt isr(void)
{
    // Se interrupção do RX
    // Monta a string recebida
    if(RCIF && RCIE)
    {
            volatile unsigned char temp = 0;      // Usada para armazenar o caracter recebido temporariamente

            temp = RCREG;   // Transfere o caracter do buffer

            // Verifica se é o inicio da mensagem
            if(temp == '@')
            {
                    rxCount = 0;
                    rx[rxCount] = temp;
                    rxCount++;
            }
            else
            {
                    rx[rxCount] = temp;
                    rxCount++;
            }

            while(!TXIF);		// Wait while TX buffer full
            TXREG = temp;		// Envia o caracter de volta

            RCIF = 0;			// Limpa o flag da interrupção
    }
    
    // Interrup��o por timer de atualiza��o dos displays
    // 60Hz
    if(TMR2IF && TMR2IE)
    {	    
	    volatile unsigned char temp = 0;
	    
	 	// Desliga as colunas
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
	 
	 	switch(display)
	 	{
		 	case 0:
		 		temp = scoreA0;
		 		temp = temp & 0x0F;
		 		colA0 = 1;
		 		break;
		 	case 1:
		 		temp = scoreA0;
		 		temp = (temp & 0xF0)>>4;
		 		colA1 = 1;
		 		break;
		 	case 2:
		 		temp = scoreA1;
		 		temp = temp & 0x0F;
		 		colA2 = 1;
		 		break;
		 	case 3:
		 		temp = scoreA1;
		 		temp = (temp & 0xF0)>>4;
		 		colA3 = 1;
		 		break;
		 	case 4:
		 		temp = scoreA2;
		 		temp = temp & 0x0F;
		 		colA4 = 1;
		 		break;
		 	case 5:
		 		temp = scoreA2;
		 		temp = (temp & 0xF0)>>4;
		 		colA5 = 1;
		 		break;
		 	case 6:
		 		temp = scoreB0;
		 		temp = temp & 0x0F;
		 		colB0 = 1;
		 		break;
		 	case 7:
		 		temp = scoreB0;
		 		temp = (temp & 0xF0)>>4;
		 		colB1 = 1;
		 		break;
		 	case 8:
		 		temp = scoreB1;
		 		temp = temp & 0x0F;
		 		colB2 = 1;
		 		break;
		 	case 9:
		 		temp = scoreB1;
		 		temp = (temp & 0xF0)>>4;
		 		colB3 = 1;
		 		break;
		 	case 10:
		 		temp = scoreB2;
		 		temp = temp & 0x0F;
		 		colB4 = 1;
		 		break;
		 	case 11:
		 		temp = scoreB2;
		 		temp = (temp & 0xF0)>>4;
		 		colB5 = 1;
		 		break;
		 	default:
		 		break;
		}
		
		switch(temp)
		{
			case 0:
				segA = 0;
				segB = 0;
				segC = 0;
				segD = 0;
				segE = 0;
				segF = 0;
				segG = 1;
				break;
			case 1:
				segA = 1;
				segB = 0;
				segC = 0;
				segD = 1;
				segE = 1;
				segF = 1;
				segG = 1;			
				break;
			case 2:
				segA = 0;
				segB = 0;
				segC = 1;
				segD = 0;
				segE = 0;
				segF = 1;
				segG = 0;
				break;
			case 3:
				segA = 0;
				segB = 0;
				segC = 0;
				segD = 0;
				segE = 1;
				segF = 1;
				segG = 0;
				break;
			case 4:
				segA = 1;
				segB = 0;
				segC = 0;
				segD = 1;
				segE = 1;
				segF = 0;
				segG = 0;
				break;
			case 5:
				segA = 0;
				segB = 1;
				segC = 0;
				segD = 0;
				segE = 1;
				segF = 0;
				segG = 0;
				break;
			case 6:
				segA = 0;
				segB = 1;
				segC = 0;
				segD = 0;
				segE = 0;
				segF = 0;
				segG = 0;
				break;
			case 7:
				segA = 0;
				segB = 0;
				segC = 0;
				segD = 1;
				segE = 1;
				segF = 1;
				segG = 1;
				break;
			case 8:
				segA = 0;
				segB = 0;
				segC = 0;
				segD = 0;
				segE = 0;
				segF = 0;
				segG = 0;
				break;
			case 9:
				segA = 0;
				segB = 0;
				segC = 0;
				segD = 0;
				segE = 1;
				segF = 0;
				segG = 0;
				break;
			default:
				break;
		}
		
	 	display++;
	 	if(display > 11)
	 	{
		 	display = 0;
		}
		
		TMR2IF = 0;	// Limpa o flag da interrup��o
	}
}
