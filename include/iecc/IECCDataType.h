/*******************************************************************************
* Project: IECC (IEC 61131-3 Languages Compiler for Arduino).                  *
* Authors: Paulo H. Torrens <paulotorrens AT gnu DOT org>.                     *
* License: GNU GPLv3+.                                                         *
*                                                                              *
* Language: (Modern) Objective-C.                                              *
* Description: Interface to represent data types of any of the IEC 61131-3     *
*   programming languages. This file will also include all the standard types  *
*   defined by the common language.                                            *
********************************************************************************
* Copyright (C) 2015 - Paulo H. Torrens. All rights reserved.                  *
*                                                                              *
* This program is free software: you can redistribute it and/or modify it      *
* under the terms of the GNU General Public License as published by the Free   *
* Software Foundation, either version 3 of the License, or (at your option)    *
* any later version.                                                           *
*                                                                              *
* This program is distributed in the hope that it will be useful, but WITHOUT  *
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        *
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     *
* more details.                                                                *
*                                                                              *
* You should have received a copy of the GNU General Public License along with *
* this program. If not, see <http://www.gnu.org/licenses/>.                    *
*******************************************************************************/
#import <Foundation/Foundation.h>
#import "IECCResource.h"

/**
* This object represents a data type on any of the programming languages.
* 
* This class is abstract and should not be created by itself.
*/
@interface IECCDataType: NSObject
  
@end

//
#import "types/IECCAny.h"
#import "types/IECCAnyBit.h"
#import "types/IECCAnyChar.h"
#import "types/IECCAnyChars.h"
#import "types/IECCAnyDate.h"
#import "types/IECCAnyDerived.h"
#import "types/IECCAnyDuration.h"
#import "types/IECCAnyElementary.h"
#import "types/IECCAnyInt.h"
#import "types/IECCAnyMagnitude.h"
#import "types/IECCAnyNum.h"
#import "types/IECCAnyReal.h"
#import "types/IECCAnySigned.h"
#import "types/IECCAnyString.h"
#import "types/IECCAnyUnsigned.h"
#import "types/IECCBool.h"
#import "types/IECCByte.h"
#import "types/IECCChar.h"
#import "types/IECCDateAndTime.h"
#import "types/IECCDate.h"
#import "types/IECCDInt.h"
#import "types/IECCDWord.h"
#import "types/IECCInt.h"
#import "types/IECCLDateAndTime.h"
#import "types/IECCLInt.h"
#import "types/IECCLReal.h"
#import "types/IECCLTime.h"
#import "types/IECCLTimeOfDay.h"
#import "types/IECCLWord.h"
#import "types/IECCReal.h"
#import "types/IECCSInt.h"
#import "types/IECCString.h"
#import "types/IECCTime.h"
#import "types/IECCTimeOfDay.h"
#import "types/IECCUDInt.h"
#import "types/IECCUInt.h"
#import "types/IECCULInt.h"
#import "types/IECCUSInt.h"
#import "types/IECCWChar.h"
#import "types/IECCWord.h"
#import "types/IECCWString.h"
