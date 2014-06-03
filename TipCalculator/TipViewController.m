//
//  TipViewController.m
//  TipCalculator
//
//  Created by Ashish Nagavaram on 6/2/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *finalAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentage;

- (IBAction)onTap:(id)sender;
- (void)calculatePercentage:(float) billAmount :(float) tipAmount;

@end

@implementation TipViewController

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
    _tipLabel.text = @"0";
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title=@"Tip Calculator";
    [_tipPercentage addTarget:self
                         action:@selector(action:)
               forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view from its nib.
}


- (void)action:(id)sender {

    [self calculatePercentage:0 :0];
}


- (void)calculatePercentage:(float) billAmount1 :(float) tipAmount {
    CGFloat billAmount = (CGFloat)[_billTextField.text floatValue];
    NSString *tip = [_tipPercentage titleForSegmentAtIndex:_tipPercentage.selectedSegmentIndex];
    tip = [tip stringByReplacingOccurrencesOfString:@"%" withString:@""];
    CGFloat tipFloat = (CGFloat)[tip floatValue];
    CGFloat totalTip = (billAmount * tipFloat) / 100;
    _tipLabel.text = [[NSNumber numberWithFloat: totalTip] stringValue];
    _finalAmountLabel.text = [[NSNumber numberWithFloat:(billAmount + totalTip)] stringValue];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {

    
    [self calculatePercentage:0 :0];
    
    /*CGFloat totalTip = (billAmount * tipFloat) / 100;
    
    _tipLabel.text = [[NSNumber numberWithFloat: totalTip] stringValue];
    
    _finalAmountLabel.text = [[NSNumber numberWithFloat:(billAmount + totalTip)] stringValue];
    */
    
    [self.view endEditing:YES];
}

@end
