/*******************************************************************************
* Project: IECC (IEC 61131-3 Languages Compiler for Arduino).                  *
* Authors: Paulo H. Torrens <paulotorrens AT gnu DOT org>.                     *
* License: GNU GPLv3+.                                                         *
*                                                                              *
* Language: (Legacy) Objective-C.                                              *
* Description:                                                                 *
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
//
#ifndef __IECC_INCLUDE_IECC_TYPES_ENUM_INCLUDE__
  #define __IECC_INCLUDE_IECC_TYPES_ENUM_INCLUDE__
  #include "types/IECCAnyDerived.h"
#endif

//
#ifndef __IECC_INCLUDE_IECC_TYPES_ENUM_DEFINE__
  #ifdef __IECC_INCLUDE_IECC_TYPES_ANY_DERIVED_DEFINE__
    #define __IECC_INCLUDE_IECC_TYPES_ENUM_DEFINE__
    
    /**
     * Data type used to store enumerations (both plain enumerations and types
     * with named elements).
     *
     * The standard describes, both semantically and syntax-wise, two different
     * kinds of types: enumerations (henceforth enums), which are simply a list
     * of unique values which were not defined by the user, and data types with
     * named elements (henceforth named values), which act basically as an enum,
     * but have an explicit elementary ype and/or have at least one of the
     * enumerated values with a set value.
     *
     * This makes, syntactically, enums a subset of named values. Ideally the
     * grammar file would follow the standard and recognize which one was being
     * defined, but this led to a minor problem: the GLR parser couldn't track
     * which values were defined on enums until it found the closing parenthesis
     * and so things like (red, green, blue, red) would be allowed. By removing
     * this rule from the grammar we were able to keep track of defined names as
     * if enums were always named values.
     */
    @interface IECCEnum: IECCAnyDerived<NSFastEnumeration> {
        // Private share
        @private
          /**
           *
           */
          NSMutableDictionary *values;
          
          /**
           *
           */
          NSNumber *last_value;
      };
      
      //
      - (instancetype)init;
      
      /**
       *
       */
      - (void)addValue: (NSString *)name as: (NSNumber *)value;
      
      /**
       *
       */
      - (NSNumber *)objectForKey: (NSString *)name;
      
      //
      - (NSUInteger)countByEnumeratingWithState: (NSFastEnumerationState *)state
                                        objects: (id *)stackbuf
                                          count: (NSUInteger)len;
      
      //
      - (void)dealloc;
    @end
  #endif
#endif
