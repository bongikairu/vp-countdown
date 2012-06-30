//
//  GlobalStore.h
//  countdown
//
//  Created by VintagePenguin on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingStore.h"

@interface GlobalStore : NSObject

+ (BOOL) loadConfig;
+ (SettingStore*) read: (int) i;
+(SettingStore*) make;
+(int) num_countdown;
+(BOOL) saveConfig;
+(BOOL) remove: (int) num;

@end
