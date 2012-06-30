//
//  SettingsController.m
//  countdown
//
//  Created by Sutas Nakasawek on 2/24/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "SettingsController.h"

@implementation SettingsController

@synthesize datePicker;
@synthesize timePicker;
@synthesize titlePicker;

SettingStore* ss;

/* Code Here Plaese */

- (void) saveDate
{
    //NSLog(@"%@",[ @"Save Date " stringByAppendingString: [[datePicker date] descriptionWithLocale:@""] ] );
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    
    [timeFormat setDateFormat:@"d"];
    int day = [[timeFormat stringFromDate:[datePicker date]] intValue];
    
    [timeFormat setDateFormat:@"M"];
    int month = [[timeFormat stringFromDate:[datePicker date]] intValue];
    
    [timeFormat setDateFormat:@"y"];
    int year = [[timeFormat stringFromDate:[datePicker date]] intValue];
    
    [ss setDay: day];
    [ss setMonth:month];
    [ss setYear:year];
}

- (void) saveTime
{
    NSLog(@"%@",[ @"Save Time " stringByAppendingString: [[timePicker date] descriptionWithLocale:@""] ] );
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    
    [timeFormat setDateFormat:@"H"];
    int hour = [[timeFormat stringFromDate:[timePicker date]] intValue];
    
    [timeFormat setDateFormat:@"m"];
    int minute = [[timeFormat stringFromDate:[timePicker date]] intValue];
    
    [ss setHour:hour];
    [ss setMinute:minute];
    
}

- (void) saveTitle
{
    NSLog(@"%@",[@"Save Title" stringByAppendingString:[titlePicker text]]);
    
    [ss setTitle:[titlePicker text]];
    
}

/* End Code Here Please */

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithSettingStore:(SettingStore*) sets{
    [super init];
    ss = sets;
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // binding picker
    
    [datePicker addTarget:self action:@selector(saveDate) forControlEvents:UIControlEventValueChanged];
    [timePicker addTarget:self action:@selector(saveTime) forControlEvents:UIControlEventValueChanged];
    [titlePicker addTarget:self action:@selector(saveTitle) forControlEvents:UIControlEventEditingChanged];
    
    // set max datepicker date
    [datePicker setMinimumDate:[NSDate dateWithTimeIntervalSinceNow:(-1*60*60*24*365)]];
    [datePicker setMaximumDate:[NSDate dateWithTimeIntervalSinceNow:(60*60*24*999)]];
    
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
    
    // set picker to saved value
    
    [titlePicker setText:[ss title]];
    
    // set picker to saved value
    
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    [dc setDay:[ss day]];
    [dc setMonth:[ss month]];
    [dc setYear:[ss year]];
    [dc setHour:[ss hour]];
    [dc setMinute:[ss minute]];
    
    NSCalendar *gC = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate *date = [gC dateFromComponents:dc];
    
    [datePicker setDate:date];
    [timePicker setDate:date];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [ss save];
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
