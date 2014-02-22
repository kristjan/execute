//
//  HWAppDelegate.m
//  Example
//
//  Created by Christopher Chan on 2/9/14.
//  Copyright (c) 2014 Christopher Chan. All rights reserved.
//

#import "HWAppDelegate.h"
#import "HWListViewController.h"

@implementation HWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor colorWithRed:1.0f green:0.2f blue:0.2f alpha:1.0f];
    
    UIViewController *viewController = [[HWListViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
