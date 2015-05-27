/*******************************************************************************
* Project: IECC (IEC 61131-3 Languages Compiler for Arduino).                  *
* Authors: Paulo H. Torrens <paulotorrens AT gnu DOT org>.                     *
* License: GNU GPLv3.                                                          *
*                                                                              *
* Language: (Modern) Objective-C.                                              *
* Description: Internal representation of a Configuration unit for IEC 61131-3 *
*   programming languages.                                                     *
*******************************************************************************/
#pragma once
#import "IECCResource.h"

/**
 * Configuration unit for the IEC 61131-3 languages.
 * 
 * According to the standard, edition 3, section 4.1, this is the basic unit of
 * the language, which corresponds to the PLC system itself. When compiled by
 * this tool, only one configuration is supported, and trying to link two of 
 * them in the same executable should result in a linking error.
 */
@interface IECCConfiguration
  
@end
