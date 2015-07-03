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

//
@implementation IECCBinder
  // Init our object
  - (instancetype)init {
    if((self = super.init)) {
      // Setup variables
      dictionary = NSMutableDictionary.new;
      enum_values = NSMutableArray.new;
    };
    
    // As always...
    return self;
  };
  
  //
  - (IECCDataType *)declareType: (NSString *)name
                             as: (IECCDataType *)type
                         atLine: (int)pos
  {
    assert("Internal compiler error." && name && type);
    [dictionary setObject: @[type, @(pos)] forKey: name.uppercaseString];
    return type;
  };
  
  //
  - (__weak IECCDataType *)type: (NSString *)name {
    id obj = [[dictionary objectForKey: name.uppercaseString]
               objectAtIndex: 0
             ];
    
    if([obj isKindOfClass: IECCDataType.class]) {
      return obj;
    };
    
    return nil;
  };
  
  //
  - (void)enterEnum: (NSString *)name {
    assert("Internal compiler error." && current_enum == nil);
    current_enum = name.uppercaseString;
  };
  
  //
  - (_Bool)isInsideEnum {
    return current_enum != nil;
  };
  
  //
  - (void)seemEnumName: (NSString *)name {
    assert("Internal compiler error." && name);
    assert("Internal compiler error." &&
      ![enum_values containsObject: name.uppercaseString]);
    
    // 
    [enum_values addObject: name.uppercaseString];
  };
  
  //
  - (NSArray *)enumValue: (NSString *)name {
    //~ int count = 0;
    
    //~ NSNumber *current = [enumeration objectForKey: name];
    //~ if(current) {
      //~ printf("We have found our key [%s]!\n", name.description.UTF8String);
      //~ count++;
    //~ };
    
    //~ for(NSString *key in dictionary) {
      //~ IECCDataType *type = [self type: key];
      //~ if([type isKindOfClass: IECCEnum.class]) {
        //~ current = [(IECCEnum *)type objectForKey: name];
        //~ if(current) {
          //~ printf("We have found our key [%s]!\n", name.description.UTF8String);
          //~ count++;
        //~ };
      //~ };
    //~ };
    
    return nil;
  };
  
  //
  - (void)leaveEnum {
    assert("Internal compiler error." && current_enum);
    [enum_values removeAllObjects];
    current_enum = nil;
  };
  
  // Cleanup memory
  - (void)dealloc {
    [dictionary autorelease];
    [enum_values autorelease];
    [super dealloc];
  };
@end
