/*******************************************************************************
* Project: IECC (IEC 61131-3 Languages Compiler for Arduino).                  *
* Authors: Paulo H. Torrens <paulotorrens AT gnu DOT org>.                     *
* License: GNU GPLv3.                                                          *
*                                                                              *
* Language: (Modern) Objective-C.                                              *
* Description: Internal representation of a Function Block unit for            *
*   IEC 61131-3 programming languages.                                         *
*******************************************************************************/
#pragma once

/**
 * Function Block unit for the IEC 61131-3 languages.
 *
 * Function blocks are instantiable functions, which means that they hold their
 * own variables and may be called. They act as classes, so that they may be
 * inherited from, and inherit from other function blocks in the object oriented
 * sence.
 */
@interface IECCFunctionBlock

@end
