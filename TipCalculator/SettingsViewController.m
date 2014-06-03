//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Ashish Nagavaram on 6/2/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import "SettingsViewController.h"




@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipPercent;

@end

@implementation SettingsViewController
NSUserDefaults *defaults;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"default_tip"];
    _defaultTipPercent.selectedSegmentIndex = intValue;
    
    
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    int tip = _defaultTipPercent.selectedSegmentIndex;
    NSLog(@"saving instance");
    [defaults setInteger:tip forKey:@"default_tip"];
    [defaults synchronize];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self viewWillDisappear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
