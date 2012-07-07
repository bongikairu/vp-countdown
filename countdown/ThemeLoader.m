//
//  ThemeLoader.m
//  countdown
//
//  Created by Sutas Nakasawek on 7/6/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "ThemeLoader.h"

#import "TemplateThemeController.h"

#import "PenguinOneThemeController.h"
#import "GreyWoodThemeController.h"
#import "SilverCeilThemeController.h"

@implementation ThemeLoader

+ (UIViewController*) loadTheme:(int) i
{
    SettingStore *ss = [GlobalStore read:i];
    
    UIViewController *safe = [[UIViewController alloc] init];
    UIViewController *want = nil;
    
    NSString *theme = [ss theme];
    TemplateThemeController *tem;
    
    if([theme isEqualToString:@"penguin1"]) {
        tem = (TemplateThemeController*) [[PenguinOneThemeController alloc] initWithCountdownNumber:i];
    } else if([theme isEqualToString:@"greywood"]) {
        tem = (TemplateThemeController*) [[GreyWoodThemeController alloc] initWithCountdownNumber:i];
    } else if([theme isEqualToString:@"silverceil"]) {
        tem = (TemplateThemeController*) [[SilverCeilThemeController alloc] initWithCountdownNumber:i];
    } else {
        // fail safe
        tem = (TemplateThemeController*) [[PenguinOneThemeController alloc] initWithCountdownNumber:i];
    }
    
    want = (UIViewController*) tem;
    
    if(want==nil) return safe;
    return want;
    
}

@end
