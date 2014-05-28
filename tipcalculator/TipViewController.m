//
//  TipViewController.m
//  tipcalculator
//
//  Created by Joseph Lee on 5/27/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "TipViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *test;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)clearBill;
- (IBAction)clearBill:(id)sender;
- (IBAction)formatBill:(id)sender;
- (IBAction)unformatBill:(id)sender;


@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self clearBill];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
  
    if(![self.billTextField.text isEqualToString:@""]) {
        NSString *btf = [self.billTextField.text substringFromIndex:1];
        
        float billAmount = [btf floatValue];
        
        
        NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
        
        float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
        float totalAmount = tipAmount + billAmount;
        
        if(billAmount >= 100) {
            self.tipLabel.text = [NSString stringWithFormat:@"$%0.0f", tipAmount];
            self.totalLabel.text = [NSString stringWithFormat:@"$%0.0f", totalAmount];
        }
        else {
            self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
            self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
        }
    }
    else {
        [self clearBill];
    }


}

- (IBAction)formatBill:(id)sender {
    if([self.billTextField.text length] < 1 ) {
        self.billTextField.text = nil;
    }
    // otherwise format to $
    else {
        float billAmount = [self.billTextField.text floatValue];
        self.billTextField.text = [NSString stringWithFormat:@"$%0.0f", billAmount];
    }
}

- (IBAction)unformatBill:(id)sender {
    
    if([self.billTextField.text length] > 1 ) {
        self.billTextField.text = [self.billTextField.text substringFromIndex:1];
    }
    
}


- (void)clearBill {
    self.billTextField.text = nil;
    self.tipLabel.text = nil;
    self.totalLabel.text = nil;
}

- (IBAction)clearBill:(id)sender {
    self.billTextField.text = nil;
    self.tipLabel.text = nil;
    self.totalLabel.text = nil;
}



@end