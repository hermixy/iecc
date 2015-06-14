/*******************************************************************************
* Project: IECC (IEC 61131-3 Languages Compiler for Arduino).                  *
* Authors: Paulo H. Torrens <paulotorrens AT gnu DOT org>.                     *
* License: GNU GPLv3+.                                                         *
*                                                                              *
* Language: (Legacy) Objective-C.                                              *
* Description: Internal representation of a Configuration unit for IEC 61131-3 *
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
#pragma once
#import <Foundation/Foundation.h>
#import "IECCResource.h"

/**
 * Configuration unit for the IEC 61131-3 languages.
 * 
 * According to the standard, edition 3, section 4.1, this is the basic unit of
 * the language, which corresponds to the PLC system itself. When compiled by
 * this tool, only one configuration is supported, and trying to link two of 
 * them in the same executable should result in a linking error.
 *
 * Figure 1 from the standard, showing some relations:
 * \code
 * +-------------------------------------------------------------------------+
 * |   +-------------------------------+ +-------------------------------+   |
 * |   | Resource                      | | Resource                      |   |
 * |   |   +------+          +------+  | |   +------+      +------+      |   |
 * |   |   | Task |          | Task |  | |   | Task |      | Task |      |   |
 * |   |   +------+          +------+  | |   +------+      +------+      |   |
 * |   |      ||  \\            ||     | |      ||            ||         |   |
 * |   |      ||   \\           ||     | |      ||            ||         |   |
 * |   | +---------+\\----------||---+ | | +---------+ +---------------+ |   |
 * |   | | Program | \\Program  ||   | | | | Program | | Program       | |   |
 * |   | |         | |\\        ||   | | | |         | |            ===|<--+ |
 * |   | |         | | +----+ +----+ | | | |         | | +----+ +----+ | | | |
 * | +-->|===      | | | FB | | FB | | | | |         | | | FB | | FB | | | | |
 * | | | |         | | +----+ +----+ | | | |         | | +----+ +----+ | | | |
 * | | | +---------+ +---------------+ | | +---------+ +---------------+ | | |
 * | | |                               | |                               | | |
 * | | | +-----------------------------+-+-----------------------------+ | | |
 * | | +-+-----------------------------+ +-----------------------------+-+ | |
 * | |   |        GLOBAL and DIRECTLY REPRESENTED VARIABLES and        |   | |
 * | |   |           INSTANCE-SPECIFIC === INITIALIZATIONS             |   | |
 * | |   +------------------------------A------------------------------+   | |
 * | |                                  |                                  | |
 * +-V----------------------------------V----------------------------------V-+
 * |                          A C E S S   P A T H S                          |
 * +-------------------------------------------------------------------------+
 * \endcode
 *
 * Note that, for this implementation, the access paths are the Arduino pins.
 */
@interface IECCConfiguration: NSObject
  
@end
