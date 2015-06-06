/*******************************************************************************
* Project: IECC (IEC 61131-3 Languages Compiler for Arduino).                  *
* Authors: Paulo H. Torrens <paulotorrens AT gnu DOT org>.                     *
* License: GNU GPLv3+.                                                         *
*                                                                              *
* Language: (Modern) Objective-C.                                              *
* Description: Interface to represent data types of any of the IEC 61131-3     *
*   programming languages.                                                     *
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

//
#ifndef __IECC_DATA_TYPE_H__
  #define __IECC_DATA_TYPE_H__
  /**
  * This object represents a data type on any of the programming languages.
  * 
  * This class is abstract and should not be created by itself.
  */
  @interface IECCDataType: NSObject
    
  @end
  
  #include "types/IECCAny.h"
  #include "types/IECCAnyBit.h"
  #include "types/IECCAnyChar.h"
  #include "types/IECCAnyChars.h"
  #include "types/IECCAnyDate.h"
  #include "types/IECCAnyDerived.h"
  #include "types/IECCAnyDuration.h"
  #include "types/IECCAnyElementary.h"
  #include "types/IECCAnyInt.h"
  #include "types/IECCAnyMagnitude.h"
  #include "types/IECCAnyNum.h"
  #include "types/IECCAnyReal.h"
  #include "types/IECCAnySigned.h"
  #include "types/IECCAnyString.h"
  #include "types/IECCAnyUnsigned.h"
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
#endif
