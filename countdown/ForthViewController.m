//
//  ForthViewController.m
//  countdown
//
//  Created by Pavares on 2/17/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "ForthViewController.h"
#import "SettingsController.h"

@implementation ForthViewController

@synthesize b_date;
@synthesize b_time;
@synthesize b_title;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
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

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self navigationController] setTitle:@"Settings"];
    
    // set picker to saved value
    
    [b_title setTitle:[SettingStore title] forState:UIControlStateNormal];
    
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    [dc setDay:[SettingStore day]];
    [dc setMonth:[SettingStore month]];
    [dc setYear:[SettingStore year]];
    [dc setHour:[SettingStore hour]];
    [dc setMinute:[SettingStore minute]];
    
    NSCalendar *gC = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate *date = [gC dateFromComponents:dc];
    
    NSString* datePart = [NSDateFormatter localizedStringFromDate: date 
                                                        dateStyle: NSDateFormatterMediumStyle
                                                        timeStyle: NSDateFormatterNoStyle];
    NSString* timePart = [NSDateFormatter localizedStringFromDate: date 
                                                        dateStyle: NSDateFormatterNoStyle 
                                                        timeStyle: NSDateFormatterShortStyle];
    
    //NSLog(@"%@ - %@",datePart,timePart);
    
    [b_date setTitle:datePart forState:UIControlStateNormal];
    [b_time setTitle:timePart forState:UIControlStateNormal];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)editTitle:(id)sender {
    UIViewController *controller = (UIViewController*)[[SettingsController alloc] initWithNibName:@"SettingsControllers_title" bundle:nil];
    [[self navigationController] pushViewController:controller animated:TRUE];
    
}

@end
