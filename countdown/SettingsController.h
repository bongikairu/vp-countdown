//
//  SettingsController.h
//  countdown
//
//  Created by VintagePenguin on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingStore.h"

@interface SettingsController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (strong, nonatomic) IBOutlet UITextField *titlePicker;

-(id)initWithSettingStore:(SettingStore*) sets;

@end
