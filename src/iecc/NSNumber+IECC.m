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
#import <assert.h>
#import <string.h>
#import "NSNumber+IECC.h"

// Verifies if `string' starts with `start', case insensitive
static const char *starts_with(char const *string, char const *start) {
  for((void)0; *string && *start; string++, start++) {
    if(tolower(*string) != tolower(*start)) {
      return NULL;
    };
  };
  
  if(*start == (char)0) {
    return string;
  };
  
  return NULL;
};

//
@implementation NSNumber(IECC)
  + (instancetype)numberWithIECString: (const char *)string {
    // We know our string is well-formed already, if it exists...
    if(string) {
      
      const char *hash = strchr(string, '#');
      
      if(hash) {
        
        char *hash;
        
        if((hash == starts_with("sint"))) {
          
        };
        
        if((hash == starts_with("int"))) {
          
        };
        
        if((hash == starts_with("dint"))) {
          
        };
        
        if((hash == starts_with("lint"))) {
          
        };
        
        if((hash == starts_with("usint"))) {
          
        };
        
        if((hash == starts_with("uint"))) {
          
        };
        
        if((hash == starts_with("udint"))) {
          
        };
        
        if((hash == starts_with("ulint"))) {
          
        };
        
      } else {
        // We should have a common number here
        char *end;
        long long result = strtoll(string, &end, 10);
        
        assert("Internal compiler error." && (*end == (char)0));
        
        if(errno == ERANGE) {
          // We are using bools to represent overflow internally
          return [NSNumber numberWithBool: YES];
        } else {
          // Read the number as a long long :)
          return [NSNumber numberWithLongLong: result];
        };
      };
      
    };
    
    return [NSNumber numberWithInt: 0];
  };
@end
