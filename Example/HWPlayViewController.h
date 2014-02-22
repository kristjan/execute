//
//  HWPlayViewController.h
//  Example
//
//  Created by Christopher Chan on 2/9/14.
//  Copyright (c) 2014 Christopher Chan. All rights reserved.
//

@interface HWPlayViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) UILabel *label;
@property (nonatomic) UIButton *button;

@property (nonatomic) NSArray *colors;
@property (nonatomic) NSInteger colorPosition;

@property (nonatomic) NSArray *quotes;
@property (nonatomic) UILabel *quote;
@property (nonatomic) NSInteger quotePosition;

@end
