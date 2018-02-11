
/* 
    Copyright (c) 2016-2018 Azeez Adewale <azeezadewale98@gmail.com"> 
    MIT License Copyright (c) 2018 simple 

*/

/* 
 * File:   consoler.h
 * Author: thecarisma
 *
 * Created on February 11, 2018, 12:26 AM
 */

#include "../../../simple/bootsrc/includes/simple.h"
#include "console-colors.h"
#include "console-colors.c"
#include "consoler.h"

SIMPLE_API __declspec(dllexport)

SIMPLE_API void init_simple_module(SimpleState *sState)
{   
    register_block("_printwfb",print_with_foreground_background);
}

SIMPLE_BLOCK(print_with_foreground_background)
{
	if ( SIMPLE_API_PARACOUNT != 3 ) {
		SIMPLE_API_ERROR(SIMPLE_API_MISS3PARA);
		return ;
	}
	SIMPLE_API_IGNORECPOINTERTYPE ;
	if ( ! SIMPLE_API_ISNUMBER(1) && ! SIMPLE_API_ISNUMBER(2) ) {
		SIMPLE_API_ERROR(SIMPLE_API_BADPARATYPE);
		return ;
	}
	if ( ! SIMPLE_API_ISSTRING(3) ) {
		SIMPLE_API_ERROR(SIMPLE_API_BADPARATYPE);
		return ;
	}
	cc_print( (int ) SIMPLE_API_GETNUMBER(1),SIMPLE_API_GETSTRING(2));
}

