//
//  GUIBoard.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/9/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
@class FunnelFoursViewController;
@interface GUIBoard : UIView {
	int radius, rowHeight, outerPadding, lineWidth, centerx, centery;
	CGColorRef fillColor, lineColor;
	FunnelFoursViewController *controller;
	CGContextRef context;
}
-(void) fillSquareWithContext:(CGContextRef)context 
				   startAngle:(float)a1 endAngle:(float)a2
					   startR:(float)r1 endR:(float)r2;
-(BOOL) isInCenterButton:(UITouch*) touch;
-(void) fillSquareWithColor:(UIColor*) color
				 startAngle:(float)a1 endAngle:(float)a2 
					 startR:(float)r1 endR:(float)r2;



@property(nonatomic, readonly) int radius, rowHeight, outerPadding, lineWidth, centerx, centery;
@property(nonatomic,readonly) CGColorRef fillColor, lineColor;
@property(nonatomic,retain,readwrite) FunnelFoursViewController *controller;
<<<<<<< HEAD
=======
=======

@interface GUIBoard : UIView {
	int radius, rowHeight, outerPadding, lineWidth;
	int centerx, centery;
	float angleShift;
	float angleVelocity;
}
>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
@end
