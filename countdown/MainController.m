//
//  MainController.m
//  countdown
//
//  Created by VintagePenguin on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"

@implementation MainController

@synthesize label_days;
@synthesize label_hours;
@synthesize label_mins;
@synthesize label_secs;

@synthesize timer_view;
@synthesize timer_text;

SettingStore* ss;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ss = [GlobalStore read:1];
    
    if(!ss) {
        ss=[GlobalStore make];
        // set target date
        [ss setDay:12];
        [ss setMonth:12];
        [ss setYear:2012];
        
        [ss setHour:0];
        [ss setMinute:0];
        
        [ss setTitle:@"World's End"];
        
        [ss save];
    }
    
    NSLog(@"Init timer");
    NSTimer *atimer = [[NSTimer alloc] init];
    atimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    timer = atimer;
    //[atimer release];
    
    [self updateTimer];
}

- (void) updateTimer
{
    //NSLog(@"Timer tick");
    
    // target
    NSDateComponents *targetc = [[NSDateComponents alloc] init];
    // 6 mar 12
    //[targetc setDay:6];
    //[targetc setMonth:3];
    //[targetc setYear:2013];
    
    //[targetc setHour:0];
    //[targetc setMinute:0];
    
    [targetc setDay:[ss day]];
    [targetc setMonth:[ss month]];
    [targetc setYear:[ss year]];
    
    [targetc setHour:[ss hour]];
    [targetc setMinute:[ss minute]];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    [cal setTimeZone:[NSTimeZone localTimeZone]];
    [cal setLocale:[NSLocale currentLocale]];
    
    NSDate *target = [cal dateFromComponents:targetc];
    NSDate *now = [[NSDate alloc] init];
    
    NSTimeInterval diff = [target timeIntervalSinceDate:now];
    
    int diffi = (int) diff;
    
    NSString *gtitle = [ss title];
    
    if(diffi<0) diffi=0;
    
    if(diffi==0) {
        // outta time
        //[timer_view setAlpha:0];
        [timer_text setText:[NSString stringWithFormat:@"%@ is now live",gtitle]];
    } else {
        [timer_text setText:[NSString stringWithFormat:@"%@ in",gtitle] ];
    }
    
    //NSLog(@"diffi = %d",diffi`);
    
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
