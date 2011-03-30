//
//  GUIBoard.m
//  FunnelFours
//
//  Created by Henry Bradlow on 3/9/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import "GUIBoard.h"
#import "FunnelFoursViewController.h"


@implementation GUIBoard

@synthesize radius, rowHeight, outerPadding, lineWidth, centerx, centery;
@synthesize fillColor, lineColor;
@synthesize controller;

float toRad(float);

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
-(void) awakeFromNib
{
	centerx = self.center.x-self.frame.origin.x;
	//if the status bar is removed, these centers need to be modified
	centery = self.center.y-self.frame.origin.y;//+10 for the height of the status bar
	radius = centerx;
	rowHeight = radius/6.;
	lineWidth = 5;
	outerPadding = 5;
}
-(void) fillSquareWithContext:(CGContextRef)localContext 
				   startAngle:(float)a1 endAngle:(float)a2 
					   startR:(float)r1 endR:(float)r2
{
	CGPoint oldCenter;
	oldCenter.x = centerx;
	oldCenter.y = centery;
	CGPoint newCenter = [self convertPoint:oldCenter toView:[controller holder]];
	CGContextAddArc(localContext,newCenter.x, newCenter.y, r1+lineWidth/2., a1, a2, 0);
	CGContextAddArc(localContext, newCenter.x, newCenter.y, r2-lineWidth/2., a2, a1, 1);
	CGContextClosePath(localContext);
	CGContextFillPath(localContext);
}
-(void) fillSquareWithColor:(UIColor*) color
				  startAngle:(float)a1 endAngle:(float)a2 
					   startR:(float)r1 endR:(float)r2
{
	CGContextSetFillColorWithColor(context, color.CGColor);
	CGContextAddArc(context,centerx, centery, r1, a1, a2, 0);
	CGContextAddArc(context, centerx, centery, r2, a2, a1, 1);
	CGContextClosePath(context);
	CGContextFillPath(context);
}
-(BOOL) isInCenterButton:(UITouch *)touch
{
	float x = centerx-[touch locationInView:self].x;
	float y = centery-[touch locationInView:self].y;
	float length = sqrt(x*x+y*y);
	return length<radius-5*rowHeight;
}
float toRad(float deg)
{
	return M_PI*deg/180.;
}
- (void)drawRect:(CGRect)rect {
    context = UIGraphicsGetCurrentContext();//the context on which to draw
	CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);//the color of the lines
	CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0 green:0 blue:1 alpha:.5].CGColor);//the color of the filled board
	CGContextSetLineWidth(context, lineWidth);//the width of the lines on the board
	
	//fill the background of the board black
	CGContextAddArc(context, centerx, centery, radius-outerPadding, 0, 8, 0);
	CGContextFillPath(context);
	
	//fill the middle button red
	//TODO: add a better looking button
	CGContextSetFillColorWithColor(context, [UIColor colorWithRed:1 green:0 blue:0 alpha:.5].CGColor);
	CGContextAddArc(context, centerx, centery, radius-outerPadding-5*rowHeight, 0, 8, 0);
	CGContextFillPath(context);
	
	
	[[controller boardModel] paintSquares];
	
	//draw the board
	//the rings
	for(int i = 0; i<=5; i++)
	{	
		CGContextMoveToPoint(context, centerx+radius-outerPadding-i*rowHeight, centery);
		CGContextAddArc(context, centerx, centery, radius-outerPadding-i*rowHeight, 0, M_PI*2, 0);
	}
	//the full major lines
	for(float i = 0; i<360;i+=45)
	{
		CGContextMoveToPoint(context, centerx-(radius-outerPadding)*cos(toRad(i)), centery-(radius-outerPadding)*sin(toRad(i)));
		CGContextAddLineToPoint(context, centerx-(radius-5*rowHeight-outerPadding)*cos(toRad(i)), 
								centery-(radius-5*rowHeight-outerPadding)*sin(toRad(i)));
	}
	//the half minor lines
	for(float i = 22.5; i<360;i+=45)
	{
		CGContextMoveToPoint(context, centerx-(radius-outerPadding)*cos(toRad(i)), centery-(radius-outerPadding)*sin(toRad(i)));
		CGContextAddLineToPoint(context, centerx-(radius-3*rowHeight-outerPadding)*cos(toRad(i)), 
								centery-(radius-3*rowHeight-outerPadding)*sin(toRad(i)));
	}	
	CGContextStrokePath(context);
	
}


- (void)dealloc {
    [super dealloc];
}


@end
