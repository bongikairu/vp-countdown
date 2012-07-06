//
//  ThemeRoller.m
//  countdown
//
//  Created by Sutas Nakasawek on 7/6/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "ThemeRoller.h"

@implementation ThemeRoller

+ (NSArray*) getUsableThemes
{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:5];
    
    NSDictionary *x = [[NSDictionary alloc] initWithObjectsAndKeys:
        @"penguin1", @"code",
        @"Penguin Force", @"name",
    nil ];
    
    [arr addObject:x];
    return arr;
    
}

@end
