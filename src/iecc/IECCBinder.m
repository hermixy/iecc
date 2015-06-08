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
#import "IECCBinder.h"
// Header made by Bison:
#import "./Parser.tmp.h"

@interface NSDictionary (subscripting)
- (id)objectForKeyedSubscript:(id)key;
@end

//
@implementation IECCBinder
  // Init our object
  - (instancetype)init {
    if((self = super.init)) {
      // Setup variables
      dictionary = NSMutableDictionary.new;
    };
    
    // As always...
    return self;
  };
  
  //
  - (void)declareType:(NSString *)name as:(IECCDataType *)type atLine:(int)pos {
    [dictionary setObject:@[type, @(pos)] forKey:name.capitalizedString];
  };
  
  //
  - (IECCDataType *)type:(NSString *)name {
    id obj = [[dictionary objectForKey: name.capitalizedString] objectAtIndex: 0];
    
    if([obj isKindOfClass: IECCDataType.class]) {
      return obj;
    };
    
    return nil;
  };
  
  // Cleanup memory
  - (void)dealloc {
    [dictionary release];
    [super dealloc];
  };
@end
