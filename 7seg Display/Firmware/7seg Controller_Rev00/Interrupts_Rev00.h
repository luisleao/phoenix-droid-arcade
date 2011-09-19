/*******************************************************************************
 * Projeto: Phoenix Arcade - 7seg display controller
 * Descrição: Header - Interrupções
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

interrupt isr(void);   // Handler das interrupções