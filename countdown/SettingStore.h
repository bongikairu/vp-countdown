//
//  SettingStore.h
//  countdown
//
//  Created by Sutas Nakasawek on 2/24/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingStore : NSData

+ (void) setDay:(int) day;
+ (void) setMonth:(int) month;
+ (void) setYear:(int) year;
+ (void) setHour:(int) hour;
+ (void) setMinute:(int) minute;
+ (void) setTitle:(NSString*) title;

+ (int) day;
+ (int) month;
+ (int) year;
+ (int) hour;
+ (int) minute;
+ (NSString*) title;

+ (void) save;
+ (BOOL) load;

@end

NSString* s_title;