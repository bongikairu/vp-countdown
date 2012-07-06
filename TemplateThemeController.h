//
//  TemplateThemeController.h
//  countdown
//
//  Created by Sutas Nakasawek on 7/6/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingStore.h"
#import "GlobalStore.h"

@interface TemplateThemeController : UIViewController

// self
- (id) initWithCountdownNumber: (int) num;
- (void) updateTimer;
// abstract
- (void) initLabel: (SettingStore*) ss;
- (void) updateLabel: (int) diff;

@end
