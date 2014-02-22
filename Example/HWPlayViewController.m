//
//  HWPlayViewController.m
//  Example
//
//  Created by Christopher Chan on 2/9/14.
//  Copyright (c) 2014 Christopher Chan. All rights reserved.
//

#import "HWPlayViewController.h"

@implementation HWPlayViewController

- (void)viewDidLoad {
    self.quotePosition = 0;
    
    [self populateQuotes];
    [self populateColors];

    self.label = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 320, 568)];
    self.label.backgroundColor = self.colors[self.quotePosition];

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 100.0f, 280.0f, 30.0f)];
    textField.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
    textField.delegate = self;
    textField.returnKeyType = UIReturnKeySend;

    self.quote = [[UILabel alloc] initWithFrame: CGRectMake(40, 0, 240, 568)];
    self.quote.lineBreakMode = NSLineBreakByWordWrapping;
    self.quote.numberOfLines = 0;
    self.quote.textAlignment = NSTextAlignmentCenter;
    self.quote.textColor = [UIColor whiteColor];
    self.quote.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    self.quote.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2f];
    self.quote.shadowOffset = CGSizeMake(0, -1);
    self.quote.text = self.quotes[self.quotePosition];

    self.button = [[UIButton alloc] initWithFrame:CGRectMake(142, 480, 36, 36)];
    [self.button setBackgroundImage:[UIImage imageNamed:@"icon_2149.png"] forState:UIControlStateNormal];
    [self.button setAlpha:0.4f];
    [self.button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.label];
    [self.label addSubview:self.quote];
    [self.view addSubview:textField];
    [self.view addSubview:self.button];
}

- (void)populateColors {
    self.colors = [NSArray arrayWithObjects:
                   [UIColor colorWithRed:0.0f green:0.75f blue:0.76f alpha:1.0f],
                   [UIColor colorWithRed:250/255.0f green:92/255.0f blue:230/255.0f alpha:1.0f],
                   [UIColor colorWithRed:254/255.0f green:87/255.0f blue:63/255.0f alpha:1.0f],
                   [UIColor colorWithRed:210/255.0f green:222/255.0f blue:0/255.0f alpha:1.0f],
                   
                   nil];
}

- (void)populateQuotes {
    self.quotes = [NSArray arrayWithObjects:
                   @"My fake plants died because I did not pretend to water them.",
                   @"I'm sick of following my dreams. I'm just going to ask them where they're goin', and hook up with them later.",
                   @"An escalator can never break: it can only become stairs. You should never see an Escalator Temporarily Out Of Order sign, just Escalator Temporarily Stairs. Sorry for the convenience.",
                   @"A waffle is like a pancake with a syrup trap.",
                   nil];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Message" message:textField.text delegate:nil cancelButtonTitle:@"Got It!" otherButtonTitles:nil];
    [alertView show];
    
    [textField resignFirstResponder];
    textField.text = nil;
    NSLog(@"Text: %@", textField.text);
    return NO;
}

- (void)buttonPressed:(id)sender {
    self.quotePosition = (self.quotePosition + 1) % self.quotes.count;
    self.quote.text = self.quotes[self.quotePosition];
    
    self.colorPosition = (self.colorPosition + 1) % self.colors.count;
    self.label.backgroundColor = self.colors[self.colorPosition];
}

@end
