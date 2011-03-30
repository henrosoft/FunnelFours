//
//  FunnelFoursAppDelegate.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/8/11.
//  Copyright Westview High School 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FunnelFoursViewController;

@interface FunnelFoursAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FunnelFoursViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FunnelFoursViewController *viewController;

@end

