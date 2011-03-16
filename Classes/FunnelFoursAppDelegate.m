//
//  FunnelFoursAppDelegate.m
//  FunnelFours
//
//  Created by Henry Bradlow on 3/8/11.
//  Copyright Westview High School 2011. All rights reserved.
//

#import "FunnelFoursAppDelegate.h"
#import "FunnelFoursViewController.h"

@implementation FunnelFoursAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
