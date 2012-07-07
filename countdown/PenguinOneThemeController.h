//
//  PenguinOneThemeController.h
//  countdown
//
//  Created by Sutas Nakasawek on 7/6/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "TemplateThemeController.h"
#import <QuartzCore/QuartzCore.h>

@interface PenguinOneThemeController : TemplateThemeController

@property (strong, nonatomic) IBOutlet UILabel *label_days;
@property (strong, nonatomic) IBOutlet UILabel *label_hours;
@property (strong, nonatomic) IBOutlet UILabel *label_mins;
@property (strong, nonatomic) IBOutlet UILabel *label_secs;
@property (strong, nonatomic) IBOutlet UILabel *timer_text;
@property (strong, nonatomic) IBOutlet UIImageView *mascot_view;

// implementation
- (void) initLabel: (SettingStore*) ss;
- (void) updateLabel: (int) diff;

@end
