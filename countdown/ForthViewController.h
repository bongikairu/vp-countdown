//
//  ForthViewController.h
//  countdown
//
//  Created by Pavares on 2/17/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingStore.h"

@interface ForthViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *b_title;
@property (strong, nonatomic) IBOutlet UIButton *b_date;
@property (strong, nonatomic) IBOutlet UIButton *b_time;

- (IBAction)editTitle:(id)sender;

@end
