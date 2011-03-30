//
//  GUIBoard.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/9/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import <UIKit/UIKit.h>
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
@end
