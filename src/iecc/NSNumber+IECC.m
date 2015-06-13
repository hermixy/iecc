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

// Our known bounds (taken from table 10 of the standard)
#define IEC_SINT_MIN  (~0x7F)
#define IEC_SINT_MAX  (+0x7F)
#define IEC_USINT_MAX (+0xFF)
#define IEC_INT_MIN   (~0x7FFF)
#define IEC_INT_MAX   (+0x7FFF)
#define IEC_UINT_MAX  (+0xFFFF)
#define IEC_DINT_MIN  (~0x7FFFFFFFl)
#define IEC_DINT_MAX  (+0x7FFFFFFFl)
#define IEC_UDINT_MAX (+0xFFFFFFFFl)
#define IEC_LINT_MIN  (~0x7FFFFFFFFFFFFFFFll)
#define IEC_LINT_MAX  (+0x7FFFFFFFFFFFFFFFll)
#define IEC_ULINT_MAX (+0xFFFFFFFFFFFFFFFFll)


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
static NSNumber *typed_int_literal(const char *string) {
  // Lets table our possible conversions
  static const struct {
    const char *name;
    _Bool is_signed;
    int64_t lower_limit;
    uint64_t higher_limit;
  } data[] = {
    {"sint",  YES, IEC_SINT_MIN, IEC_SINT_MAX},
    {"int",   YES, IEC_INT_MIN,  IEC_INT_MAX},
    {"dint",  YES, IEC_DINT_MIN, IEC_DINT_MAX},
    {"lint",  YES, IEC_LINT_MIN, IEC_LINT_MAX},
    {"usint", NO,  0,            IEC_USINT_MAX},
    {"uint",  NO,  0,            IEC_UINT_MAX},
    {"udint", NO,  0,            IEC_UDINT_MAX},
    {"ulint", NO,  0,            IEC_ULINT_MAX},
  };
  
  // Try each conversion!
  for(int i = 0; i < sizeof(data) / sizeof(*data); i++) {
    // Get our type prefix
    const char *hash = starts_with(string, data[i].name);
    if(hash) {
      
      // Check for correctness...
      assert("Internal compiler error." && '#' == *hash);
      
      // Lets try our cast
      char *end;
      union {
        long long ll;
        unsigned long long ull;
      } result;
      
      // There are two possible conversions!
      if(data[i].is_signed) {
        result.ll = strtoll(hash + 1, &end, 10);
      } else {
        result.ull = strtoull(hash + 1, &end, 10);
      };
      
      // Check for correctness...
      assert("Internal compiler error." && (*end == (char)0));
      
      // Did we get a range error?
      if(errno == ERANGE) {
        // Warn the user
        out_of_limits(string, data[i].lower_limit, data[i].higher_limit);
        
        // Return our minimum/maximum
        return @(hash[1] == '-' ? data[i].lower_limit : data[i].higher_limit);
      };
      
      // We have our number now :)
      return data[i].is_signed ? @(result.ll) : @(result.ull);
    };
  };
  
  // We shouldn't fall here!
  assert(!"Internal compiler error.");
};

//
static NSNumber *untyped_int_literal(const char *string) {
  char *end;
  long long result = strtoll(string, &end, 10);
  
  // Our string should be well behaved, so...
  assert("Internal compiler error." && (*end == (char)0));
  
  // Did we get a range error?
  if(errno == ERANGE) {
    // Warn the user
    out_of_limits(string, IEC_LINT_MIN, IEC_LINT_MAX);
    
    // Return our minimum/maxium
    return @(*string == '-' ? IEC_LINT_MIN : IEC_LINT_MAX);
  };
  
  // Convert the number!
  return @(result);
};

//
@implementation NSNumber(IECC)
  //
  + (instancetype)numberWithIECString: (const char *)string {
    // Just to be sure...
    assert("Internal compiler error." && string);
    
    // Do we have a hash sign in our string?
    const char *hash = strchr(string, '#');
    if(hash) {
      /* TODO: different bases! */
      
      // All known conversions
      return typed_int_literal(string);
    } else {
      return untyped_int_literal(string);
    };
  };
  
  //
  + add: (NSNumber *)other {
    
  };
  
  //
  + sub: (NSNumber *)other {
    
  };
  
  //
  + div: (NSNumber *)other {
    
  };
  
  //
  + mul: (NSNumber *)other {
    
  };
  
  //
  + mod: (NSNumber *)other {
    
  };
  
  //
  + pow: (NSNumber *)other {
    
  };
@end
