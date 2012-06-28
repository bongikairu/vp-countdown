//
//  GlobalStore.m
//  countdown
//
//  Created by VintagePenguin on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GlobalStore.h"

@implementation GlobalStore

int num_countdown;

+(BOOL) loadConfig
{
    NSString *storePath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *path = [storePath stringByAppendingPathComponent:@"config.plist"];
    NSDictionary *sett = [NSDictionary dictionaryWithContentsOfFile:path];
    if(sett==nil){
        [self saveConfig];
    }
    else{
        NSDictionary *data = [NSDictionary dictionaryWithDictionary:[sett objectForKey:@"data"] ];
        num_countdown=[[data objectForKey:@"f_num_countdown"] intValue];
    }
    if(num_countdown==0){
        SettingStore* ss = [SettingStore initWithFilename:@"settings_target_1.plist"];
        [ss setDay:15];
        [ss setMonth:8];
        [ss setYear:2012];
        [ss setHour:8];
        [ss setMinute:30];
        [ss setTitle:@"Developer Birth Day Party"];
        [ss save];
        num_countdown=1;
        [self saveConfig];
    }
    [self read: 1];
    return true;
}

+(BOOL) saveConfig{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];
    NSNumber *v_num_countdown = [NSNumber numberWithInt:num_countdown];
    [dict setObject:v_num_countdown forKey:@"f_num_countdown"];
    NSString *storePath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *path = [storePath stringByAppendingPathComponent:@"config.plist"];
	NSLog(@"path = %@",path);
    NSMutableDictionary *sett = [NSMutableDictionary dictionaryWithCapacity:3];
    [sett setObject:@"1.0" forKey:@"version"];
    [sett setObject:[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] forKey:@"timestamp"];
    
    [sett setObject:dict forKey:@"data"];
    
    [sett writeToFile:path atomically:YES];
    return true;
}

+(int) num_countdown{
    return num_countdown;
}

+(SettingStore*) read: (int) i{
    SettingStore *ss = [SettingStore initWithFilename:[NSString stringWithFormat: @"settings_target_%d.plist",i]];
    if([ss load]) return ss;
    else return nil;
}

+(SettingStore*) make{
    SettingStore *ss = [SettingStore initWithFilename:[NSString stringWithFormat: @"settings_target_%d.plist",num_countdown+1]];
    num_countdown++;
    return ss;
}



@end