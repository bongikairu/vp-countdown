//
//  TemplateThemeController.m
//  countdown
//
//  Created by Sutas Nakasawek on 7/6/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "TemplateThemeController.h"

@interface TemplateThemeController ()

@end

@implementation TemplateThemeController

SettingStore* ss;
int num_me;
NSTimer *timer;

bool shownav = FALSE;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithCountdownNumber:(int) num{
    [super init];
    num_me=num;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[self navigationController] setNavigationBarHidden:TRUE animated:FALSE];
    
    ss = [GlobalStore read:num_me];
    
    if(!ss) {
        NSLog(@"This shouldn't be happenning");
    }
    
    [self initLabel:ss];
    
    NSLog(@"Init timer");
    NSTimer *atimer = [[NSTimer alloc] init];
    atimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    timer = atimer;
    //[atimer release];
    
    [self updateTimer];
}

- (void) initLabel:(SettingStore *)ss {
    NSLog(@"This shouldn't happen . . . [from inside template initLabel code]");
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"Touch ended");
    [[self navigationController] setNavigationBarHidden:shownav animated:TRUE];
    shownav = !shownav;
}

- (void) updateTimer
{
    //NSLog(@"Timer tick");

    NSDateComponents *targetc = [[NSDateComponents alloc] init];
    
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
    
    if(diffi<0) diffi=0;

    [self updateLabel:diffi];
    
}

- (void) updateLabel:(int)diff {
    NSLog(@"This shouldn't happen . . . [from inside template updateLabel code]");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
