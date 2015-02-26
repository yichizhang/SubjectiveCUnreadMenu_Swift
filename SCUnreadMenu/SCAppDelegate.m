//
//  SCAppDelegate.m
//  SCUnreadMenu
//
//  Created by Sam Page on 16/03/14.
//  Copyright (c) 2014 Subjective-C. All rights reserved.
//

#import "SCAppDelegate.h"
#import "SCUnreadMenu-Swift.h"

@implementation SCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.rootViewController = [[SCRootViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = _rootViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
