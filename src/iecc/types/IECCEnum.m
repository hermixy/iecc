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
#import "types/IECCEnum.h"

@implementation IECCEnum
  //
  - (instancetype)init {
    if((self = super.init)) {
      self->values = NSMutableDictionary.new;
    };
    return self;
  };
  
  //
  + (IECCEnum *)enumWithValues: (NSArray *)values {
    IECCEnum *myself = self.new;
    
    if(myself) {
      // So far we really don't care for values
      for(id i in values) {
        [myself->values setObject: [i objectAtIndex: 1]
                           forKey: [i objectAtIndex: 0]];
      };
      
    };
    
    return myself;
  };
  
  //
  - (void)dealloc {
    [values autorelease];
    [super dealloc];
  };
@end
