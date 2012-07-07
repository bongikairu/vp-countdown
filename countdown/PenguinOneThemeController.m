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
@synthesize mascot_view;

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
    [self navigationController].navigationBar.barStyle = UIBarStyleBlackTranslucent;
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
    
    // [self setFontWithPosition:label_days labelValue:day threePosSize:59 twoPosSize:69 onePosSize:100];
    // [self setFontWithPosition:label_hours labelValue:hour threePosSize:59 twoPosSize:69 onePosSize:100];
    // [self setFontWithPosition:label_mins labelValue:min threePosSize:59 twoPosSize:69 onePosSize:100];
    // [self setFontWithPosition:label_secs labelValue:sec threePosSize:59 twoPosSize:69 onePosSize:100];
    
    if (day > 99) {
        [label_days setFont:[UIFont fontWithName:@"Copperplate-Bold" size:67]];
    } else if (day < 10) {
        [label_days setFont:[UIFont fontWithName:@"Copperplate-Bold" size:130]];
    } else {
        [label_days setFont:[UIFont fontWithName:@"Copperplate-Bold" size:86]];
    }
    
    if (hour < 10 && day == 0) {
        [label_hours setFont:[UIFont fontWithName:@"Copperplate-Bold" size:54]];
    } else {
        [label_hours setFont:[UIFont fontWithName:@"Copperplate-Bold" size:38]];
    }
    
    if (min < 10 && hour == 0 && day == 0) {
        [label_mins setFont:[UIFont fontWithName:@"Copperplate-Bold" size:44]];
    } else {
        [label_mins setFont:[UIFont fontWithName:@"Copperplate-Bold" size:30]];
    }
    
    if (sec < 10 && min == 0 && hour == 0 && day == 0) {
        [label_secs setFont:[UIFont fontWithName:@"Copperplate-Bold" size:38]];
    } else {
        [label_secs setFont:[UIFont fontWithName:@"Copperplate-Bold" size:24]];
    }
    
    mascot_view.layer.anchorPoint = CGPointMake(0.49, 0.644);
    if (sec % 2) {
        // [mascot_view setTransform:CGAffineTransformMakeRotation(-M_PI / 18)];
        [UIView beginAnimations:@"animateImageOff" context:NULL]; // Begin animation
		[mascot_view setTransform:CGAffineTransformMakeRotation(-M_PI / 18)]; // Move imageView off screen
		[UIView commitAnimations]; // End animations
    } else {
        // [mascot_view setTransform:CGAffineTransformMakeRotation(M_PI / 18)];
        [UIView beginAnimations:@"animateImageOff" context:NULL]; // Begin animation
		[mascot_view setTransform:CGAffineTransformMakeRotation(M_PI / 24)]; // Move imageView off screen
		[UIView commitAnimations]; // End animations
    }
    
    CABasicAnimation *scrollText = [CABasicAnimation animationWithKeyPath:@"position.x"];
    scrollText.duration = 3.0;
    //scrollText.repeatCount = 100000;
    //scrollText.autoreverses = NO;
    scrollText.fromValue = [NSNumber numberWithFloat:300];
    scrollText.toValue = [NSNumber numberWithFloat:-1300.0];
    
    [[timer_text layer] addAnimation:scrollText forKey:@"scrollTextKey"];
    
}

- (void) setFontWithPosition: (UILabel *)label 
                  labelValue: (int)amount 
                threePosSize: (int)threeSize 
                  twoPosSize: (int)twoSize 
                  onePosSize: (int)oneSize {
    if (amount > 99) {
        [label setFont:[UIFont fontWithName:@"Copperplate-Bold" size:threeSize]];
    } else if (amount < 10) {
        [label setFont:[UIFont fontWithName:@"Copperplate-Bold" size:oneSize]];
    } else {
        [label setFont:[UIFont fontWithName:@"Copperplate-Bold" size:twoSize]];
    }
}

@end
