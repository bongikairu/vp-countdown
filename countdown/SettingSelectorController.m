//
//  SettingSelectorController.m
//  countdown
//
//  Created by VintagePenguin on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingSelectorController.h"
#import "GlobalStore.h"
#import "ForthViewController.h"
#import "SettingStore.h"

@implementation SettingSelectorController

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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0) return [GlobalStore num_countdown];
    if(section==1) return 1;
    if(section==2) return 1;
    return 0;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.section==0){
        cell.textLabel.text = [[GlobalStore read:indexPath.row+1] title];
    }
    if(indexPath.section==1){
        cell.textLabel.text = [NSString stringWithFormat:@"Add Countdown"];
        [cell.imageView setImage:[UIImage imageNamed:@"19-gear.png"]];
    }
    if(indexPath.section==2){
        cell.textLabel.text = [NSString stringWithFormat:@"Global Settings"];
        [cell.imageView setImage:[UIImage imageNamed:@"19-gear.png"]];
    }
    
    return cell;
    
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    if(section==0) return @"Countdown Settings";
    return @"";
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int section=indexPath.section,row=indexPath.row;
    

    if(section==0){
        ForthViewController *fvc = [[ForthViewController alloc] initWithCountdownNumber:row+1];
        UIViewController* controller = (UIViewController*) fvc;
        [[self navigationController] pushViewController:controller animated:true];
    }
    if(section==1){
        [GlobalStore make];
        ForthViewController *fvc = [[ForthViewController alloc] initWithCountdownNumber:[GlobalStore num_countdown]];
        UIViewController* controller = (UIViewController*) fvc;
        [[self navigationController] pushViewController:controller animated:true];
    }
    if(section==2){
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
