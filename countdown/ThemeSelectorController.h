//
//  ThemeSelectorController.h
//  countdown
//
//  Created by VintagePenguin on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingStore.h"

@interface ThemeSelectorController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView* table;
@property (strong, nonatomic) IBOutlet UILabel* themeName;
@property (strong, nonatomic) IBOutlet UIImageView* themeImage;

-(id)initWithSettingStore:(SettingStore*) sets;

@end
