//
//  ForthViewController.m
//  countdown
//
//  Created by Pavares on 2/17/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "ForthViewController.h"
#import "GlobalStore.h"
#import "SettingsController_title.h"
#import "SettingsController_date.h"
#import "SettingsController_Time.h"
#import "SettingsController_url.h"
#import "ThemeRoller.h"
#import "ThemeSelectorController.h"

@implementation ForthViewController

@synthesize b_date;
@synthesize b_time;
@synthesize b_title;
@synthesize b_theme;
@synthesize b_setting;

SettingStore* ss;
int fv_num;

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
    ss = [GlobalStore read:num];
    fv_num=num;
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
    
    [b_title setTitle:[ss title] forState:UIControlStateNormal];
    
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    [dc setDay:[ss day]];
    [dc setMonth:[ss month]];
    [dc setYear:[ss year]];
    [dc setHour:[ss hour]];
    [dc setMinute:[ss minute]];
    
    NSCalendar *gC = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate *date = [gC dateFromComponents:dc];
    
    NSString* datePart = [NSDateFormatter localizedStringFromDate: date 
                                                        dateStyle: NSDateFormatterMediumStyle
                                                        timeStyle: NSDateFormatterNoStyle];
    NSString* timePart = [NSDateFormatter localizedStringFromDate: date 
                                                        dateStyle: NSDateFormatterNoStyle 
                                                        timeStyle: NSDateFormatterShortStyle];
    NSString* themePart = nil;
    
    //NSLog(@"%@ - %@",datePart,timePart);
    
    [b_date setTitle:datePart forState:UIControlStateNormal];
    [b_time setTitle:timePart forState:UIControlStateNormal];
    [b_theme setTitle:themePart forState:UIControlStateNormal];
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
    UIViewController *controller = (UIViewController*)[[SettingsController_title alloc] initWithSettingStore:ss];
    [[self navigationController] pushViewController:controller animated:TRUE];
}

- (IBAction)editDate:(id)sender {
    UIViewController *controller = (UIViewController*)[[SettingsController_date alloc] initWithSettingStore:ss];
    [[self navigationController] pushViewController:controller animated:TRUE];
}

- (IBAction)editTime:(id)sender {
    UIViewController *controller = (UIViewController*)[[SettingsController_time alloc] initWithSettingStore:ss];
    [[self navigationController] pushViewController:controller animated:TRUE];
}

- (IBAction)editUrl:(id)sender {
    UIViewController *controller = (UIViewController*)[[SettingsController_url alloc] initWithSettingStore:ss];
    [[self navigationController] pushViewController:controller animated:TRUE];
}

- (IBAction)editTheme:(id)sender{
    UIViewController *controller = (UIViewController*)[[ThemeSelectorController alloc] init];
    [[self navigationController] pushViewController:controller animated:TRUE];
}

- (IBAction)editSetting:(id)sender{
    UIViewController *controller = nil;
    [[self navigationController] pushViewController:controller animated:TRUE];
}

- (IBAction)deleteCountdown:(id)sender{
    if([GlobalStore num_countdown]==1){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to delete" 
                                                        message:@"You need to have at least one countdown"
                                                       delegate:nil                                          
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil ];
        [alert show];
        return;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm Deletion" 
        message:[NSString stringWithFormat:@"Are you sure you want to delete \"%@\"",[ss title]]
        delegate:self
        cancelButtonTitle:nil
        otherButtonTitles:@"Sure",@"No",nil ];
    //alert.cancelButtonIndex = 0;
    [alert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //[GlobalStore removeCountdown:i];
    if(buttonIndex==1){
        //NSLog(@"Removing c #%d",buttonIndex);
        return;
    }
    [GlobalStore remove:fv_num];
    [[self navigationController] popViewControllerAnimated:TRUE];
}

@end
