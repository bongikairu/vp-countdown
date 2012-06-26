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
        num_countdown=0;
        //new countdown
    }
    else{
        NSDictionary *data = [NSDictionary dictionaryWithDictionary:[sett objectForKey:@"data"] ];
        num_countdown=[[data objectForKey:@"f_num_countdown"] intValue];
    }
    [self read: 1];
    return true;
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
