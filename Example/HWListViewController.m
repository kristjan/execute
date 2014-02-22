//
//  HWListViewController.m
//  Example
//
//  Created by Christopher Chan on 2/9/14.
//  Copyright (c) 2014 Christopher Chan. All rights reserved.
//

#import "HWListViewController.h"

@interface HWListViewController () <UITextFieldDelegate>

@property (nonatomic) NSMutableArray *tasks;

@end

@implementation HWListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 260, 32)];
    textField.returnKeyType = UIReturnKeyGo;
    textField.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.1f];
    textField.placeholder = @"Who do you want to execute?";
    textField.delegate = self;
    self.navigationItem.titleView = textField;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"😫" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEdit:)];

    NSArray *loadedTasks = [[NSUserDefaults standardUserDefaults] arrayForKey:@"tasks"];
    self.tasks = [[NSMutableArray alloc] initWithArray:loadedTasks];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.tasks[indexPath.row];
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.tasks insertObject:textField.text atIndex:0];
    
    [self.tableView beginUpdates];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];

    [self.tableView endUpdates];

    textField.text = nil;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.tasks forKey:@"tasks"];
    [userDefaults synchronize];

    return NO;
}


- (void)toggleEdit:(id)sender {
    [self setEditing:!self.editing animated:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    if (editing) {
      self.navigationItem.rightBarButtonItem.title = @"👍";
    } else {
      self.navigationItem.rightBarButtonItem.title = @"✏️";
    }
}
    
@end
