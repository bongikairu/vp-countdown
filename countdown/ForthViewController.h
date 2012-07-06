//
//  ForthViewController.h
//  countdown
//
//  Created by Pavares on 2/17/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingStore.h"

@interface ForthViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *b_title;
@property (strong, nonatomic) IBOutlet UIButton *b_date;
@property (strong, nonatomic) IBOutlet UIButton *b_time;
@property (strong, nonatomic) IBOutlet UIButton *b_theme;
@property (strong, nonatomic) IBOutlet UIButton *b_setting;


- (IBAction)editTitle:(id)sender;
- (IBAction)editDate:(id)sender;
- (IBAction)editTime:(id)sender;
- (IBAction)editUrl:(id)sender;
- (IBAction)editTheme:(id)sender;
- (IBAction)editSetting:(id)sender;
- (IBAction)deleteCountdown:(id)sender;
-(id)initWithCountdownNumber:(int) num;

@end
