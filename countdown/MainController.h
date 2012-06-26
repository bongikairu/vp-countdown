//
//  MainController.h
//  countdown
//
//  Created by VintagePenguin on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingStore.h"
#import "GlobalStore.h"

@interface MainController : UIViewController

- (void) updateTimer;

@property (strong, nonatomic) IBOutlet UILabel *label_days;
@property (strong, nonatomic) IBOutlet UILabel *label_hours;
@property (strong, nonatomic) IBOutlet UILabel *label_mins;
@property (strong, nonatomic) IBOutlet UILabel *label_secs;

@property (strong, nonatomic) IBOutlet UIView *timer_view;
@property (strong, nonatomic) IBOutlet UILabel *timer_text;

@end

NSTimer *timer;
