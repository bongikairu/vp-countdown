//
//  ThemeRoller.m
//  countdown
//
//  Created by Sutas Nakasawek on 7/6/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "ThemeRoller.h"

@implementation ThemeRoller

+ (NSArray*) getThemes
{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:5];
    
    NSDictionary *x = [[NSDictionary alloc] initWithObjectsAndKeys:
                       @"penguin1", @"code",
                       @"Penguin Force", @"name",
                       @"scrsh_penguinforce.jpg", @"screenshot",
                       [NSNumber numberWithBool:TRUE], @"usable",
    nil ];
    
    [arr addObject:x];
    
    NSDictionary *y = [[NSDictionary alloc] initWithObjectsAndKeys:
                       @"greywood", @"code",
                       @"Grey Wood", @"name",
                       @"scrsh_greywood.jpg", @"screenshot",
                       [NSNumber numberWithBool:TRUE], @"usable",
                       nil ];
    
    [arr addObject:y];
    
    NSDictionary *z = [[NSDictionary alloc] initWithObjectsAndKeys:
                       @"silverceil", @"code",
                       @"Silver Ceil", @"name",
                       @"scrsh_greywood.jpg", @"screenshot",
                       [NSNumber numberWithBool:TRUE], @"usable",
                       nil ];
    
    [arr addObject:z];
    
    return arr;
    
}

+ (NSDictionary*) getThemesDictionary
{
    NSArray *arr = [self getThemes];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:[arr count]];
    for (int i=0;i<[arr count];i++) {
        NSDictionary *t = [arr objectAtIndex:i];
        [dict setValue:t forKey:[t objectForKey:@"code"]];
    }
    return dict;
}

+ (NSString*) getThemeNameByCode: (NSString*) code
{
    NSDictionary *d = [self getThemesDictionary];
    NSDictionary *my = [d objectForKey:code];
    if(my!=nil) {
        return [my objectForKey:@"name"];
    } else {
        return nil;
    }
}

@end
