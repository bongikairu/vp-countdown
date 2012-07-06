//
//  ThemeRoller.h
//  countdown
//
//  Created by Sutas Nakasawek on 7/6/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeRoller : NSObject

+ (NSArray*) getThemes;

+ (NSString*) getThemeNameByCode: (NSString*) code;

@end
