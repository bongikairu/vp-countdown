//
//  PenguinOneThemeController.m
//  countdown
//
//  Created by Sutas Nakasawek on 7/6/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "PenguinOneThemeController.h"

@interface PenguinOneThemeController ()

@end

@implementation PenguinOneThemeController

@synthesize label_days;
@synthesize label_hours;
@synthesize label_mins;
@synthesize label_secs;
@synthesize timer_text;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// abstract template implementation

- (void) initLabel:(SettingStore *)ss {
    
    //[self navigationController].navigationBar.translucent = TRUE;
    [self navigationController].navigationBar.barStyle = UIBarStyleDefault;
    //[self navigationController].navigationBar.tintColor = [UIColor blackColor];
    
    NSString *gtitle = [ss title];    
    [timer_text setText:[NSString stringWithFormat:@"%@",gtitle] ];
    
}

- (void) updateLabel:(int)diff {
    
    int diffi = diff;
   
    int temp = 0;
    
    int sec = diffi % 60;
    temp = diffi / 60;
    int min = temp % 60;
    temp = temp/60;
    int hour = temp%24;
    int day = temp/24;
    
    [label_days setText:[NSString stringWithFormat:@"%d", day]];
    [label_hours setText:[NSString stringWithFormat:@"%d", hour]];
    [label_mins setText:[NSString stringWithFormat:@"%d", min]];
    [label_secs setText:[NSString stringWithFormat:@"%d", sec]];
    
}

@end
