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
#import <limits.h>
#import "NSNumber+IECC.h"

//
#define SINT_MIN (~0x7F)
#define SINT_MAX (+0x7F)
#define  INT_MIN (~0x7FFF)
#define  INT_MAX (+0x7FFF)
#define DINT_MIN (~0x7FFFFFFF)
#define DINT_MAX (+0x7FFFFFFF)
#define LINT_MIN (~0x7FFFFFFFFFFFFFFF)
#define LINT_MAX (+0x7FFFFFFFFFFFFFFF)

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
static void out_of_limits(const char *string, int64_t lower, uint64_t higher) {
  printf("Numeric literal %s out of range! It should be between %"PRId64" and %"
         PRIu64".\n", string, lower, higher);
};

//
@implementation NSNumber(IECC)
  + (instancetype)numberWithIECString: (const char *)string {
    // We know our string is well-formed already, if it exists...
    if(string) {
      
      const char *hash = strchr(string, '#');
      
      if(hash) {
        
        char *hash;
        
        if((hash = starts_with(string, "16"))) {
          
        };
        
        if((hash = starts_with(string, "8"))) {
          
        };
        
        if((hash = starts_with(string, "2"))) {
          
        };
        
        char *end;
        long long result = strtoll(string, &end, 10);
        
        if((hash = starts_with(string, "sint"))) {
          
        };
        
        if((hash = starts_with(string, "int"))) {
          
        };
        
        if((hash = starts_with(string, "dint"))) {
          
        };
        
        if((hash = starts_with(string, "lint"))) {
          
        };
        
        if((hash = starts_with(string, "usint"))) {
          
        };
        
        if((hash = starts_with(string, "uint"))) {
          
        };
        
        if((hash = starts_with(string, "udint"))) {
          
        };
        
        if((hash = starts_with(string, "ulint"))) {
          
        };
        
        // We shouldn't fall here!
        assert("Internal compiler error." && NULL);
        
      } else {
        // We should have a common number here
        char *end;
        long long result = strtoll(string, &end, 10);
        
        // Our string should be well behaved, so...
        assert("Internal compiler error." && (*end == (char)0));
        
        // Did we get a range error?
        if(errno == ERANGE) {
          // We are using bools to represent overflow internally
          out_of_limits(string, LINT_MIN, LINT_MAX);
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
