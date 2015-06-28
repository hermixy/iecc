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
#import "NSNumber+IECC.h"

@implementation IECCEnum
  //
  - (instancetype)init {
    if((self = super.init)) {
      values = NSMutableDictionary.new;
      last_value = @(0);
    };
    return self;
  };
  
  //
  - (NSNumber *)objectForKey: (NSString *)name {
    return [values objectForKey: name.uppercaseString];
  };
  
  //
  - (void)addValue: (NSString *)name as: (NSNumber *)value {
    //~ printf("Adding enum value (%s) to be (%s).\n",
      //~ name.description.UTF8String,
      //~ value.description.UTF8String
    //~ );
    if([NSNull null] == (id)value) {
      [self addValue: name as: last_value];
    } else {
      // TODO: I'm not sure yet how I'll be handling enum values
      // in the lexer, so we might need to remove this check
      assert("Internal compiler error" &&
        [values objectForKey: name.uppercaseString] == nil);
      
      // Just to be sure...
      assert("Internal compiler error" &&
        value &&
        [value isKindOfClass: NSNumber.class]);
      
      // Set value up ;)
      [values setObject: value forKey: name.uppercaseString];
      
      // Increase our value
      last_value = [value add: @(1)];
    };
  };
  
  - (NSUInteger)countByEnumeratingWithState: (NSFastEnumerationState *)state
                                    objects: (id *)stackbuf
                                      count: (NSUInteger)len
  {
    return [values countByEnumeratingWithState: state
                                       objects: stackbuf
                                         count: len];
  };
  
  //
  - (void)dealloc {
    [values autorelease];
    [super dealloc];
  };
@end
