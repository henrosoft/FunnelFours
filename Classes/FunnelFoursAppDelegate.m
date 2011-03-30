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
<<<<<<< HEAD
	[NSTimer scheduledTimerWithTimeInterval:1./60. target:viewController selector:@selector(tick:) userInfo:nil repeats:YES];
	//attempted threading
//	[viewController performSelectorInBackground:@selector(run:) withObject:nil];
=======
>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
