//
//  SettingStore.m
//  countdown
//
//  Created by Sutas Nakasawek on 2/24/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "SettingStore.h"

@implementation SettingStore

int s_rnum = 0;

int s_day;
int s_month;
int s_year;
int s_hour;
int s_minute;
//NSString* s_title;
//NSString* s_filename;

+ (SettingStore*) initWithFilename:(NSString *)filename
{
    SettingStore *ss = [[SettingStore alloc] init];
    s_rnum = arc4random_uniform(10000);// arc4random();
    [ss setFilename:filename];
    NSLog(@"it's %d",s_rnum);
    
    return ss;
}

- (void) setFilename:(NSString*) nfile
{
    //s_filename = nfile;
    NSString *ns = [NSString stringWithString:nfile];
    //NSLog(@"someone saving title : %@",ns);
    //s_title = ns;
    //NSLog(@"titler : %@",s_title);
    [[NSUserDefaults standardUserDefaults] setObject:ns forKey:[NSString stringWithFormat:@"SS_FNAME_%d",s_rnum]];
}
- (NSString*) filename
{
    NSString *ns = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"SS_FNAME_%d",s_rnum]];
    //return s_filename;
    NSLog(@"wanting %@",ns);
    return ns;
}

- (void) setDay:(int) day
{
    s_day = day;
}
- (void) setMonth:(int) month
{
    s_month = month;
}
- (void) setYear:(int) year
{
    s_year = year;
}
- (void) setHour:(int) hour
{
    s_hour = hour;
}
- (void) setMinute:(int) minute
{
    s_minute = minute;
}
- (void) setTitle:(NSString *)title
{
    NSString *ns = [NSString stringWithString:title];
    //NSLog(@"someone saving title : %@",ns);
    //s_title = ns;
    //NSLog(@"titler : %@",s_title);
    [[NSUserDefaults standardUserDefaults] setObject:ns forKey:[NSString stringWithFormat:@"SS_TITLE_%d",s_rnum]];
}

- (int) day
{
    return s_day;
}
- (int) month
{
    return s_month;
}
- (int) year
{
    return s_year;
}
- (int) hour
{
    return s_hour;
}
- (int) minute
{
    return s_minute;
}
- (NSString*) title
{
    //NSLog(@"title : %@",s_title);
    //NSString *ns = [NSString stringWithString:s_title];
    //NSLog(@"someone calling title : %@",ns);
    NSString *ns = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"SS_TITLE_%d",s_rnum]];
    return ns;
}

- (void) save
{
    NSString* s_filename = [self filename];
    NSLog(@"saving to %@",s_filename);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];
    
    NSNumber *v_day = [NSNumber numberWithInt:s_day];
    NSNumber *v_month = [NSNumber numberWithInt:s_month];
    NSNumber *v_year = [NSNumber numberWithInt:s_year];
    NSNumber *v_hour = [NSNumber numberWithInt:s_hour];
    NSNumber *v_minute = [NSNumber numberWithInt:s_minute];
    
    [dict setObject:v_day forKey:@"s_day"];
    [dict setObject:v_month forKey:@"s_month"];
    [dict setObject:v_year forKey:@"s_year"];
    [dict setObject:v_hour forKey:@"s_hour"];
    [dict setObject:v_minute forKey:@"s_minute"];
    [dict setObject:[self title] forKey:@"s_title"];
    
    NSString *storePath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *path = [storePath stringByAppendingPathComponent:s_filename];
	NSLog(@"path = %@",path);
    
    NSMutableDictionary *sett = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [sett setObject:@"1.0" forKey:@"version"];
    [sett setObject:[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] forKey:@"timestamp"];
    
    [sett setObject:dict forKey:@"data"];
    
    [sett writeToFile:path atomically:YES];
    
    NSLog(@"Target Date Settings saved.");
}

- (BOOL) load
{
    NSString* s_filename = [self filename];
    
    NSString *storePath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *path = [storePath stringByAppendingPathComponent:s_filename];
	NSLog(@"path = %@",path);
    
    NSDictionary *sett = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if(sett==nil) return false;
    
    NSDictionary *data = [NSDictionary dictionaryWithDictionary:[sett objectForKey:@"data"] ];
    
    [self setDay:[[data objectForKey:@"s_day"] intValue]];
    [self setMonth:[[data objectForKey:@"s_month"] intValue]];
    [self setYear:[[data objectForKey:@"s_year"] intValue]];
    [self setHour:[[data objectForKey:@"s_hour"] intValue]];
    [self setMinute:[[data objectForKey:@"s_minute"] intValue]];
    
    [self setTitle:[data objectForKey:@"s_title"]];
    
    NSLog(@"Target Date Settings loaded.");
    
    return true;
    
}

@end
