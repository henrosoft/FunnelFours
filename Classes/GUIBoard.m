//
//  GUIBoard.m
//  FunnelFours
//
//  Created by Henry Bradlow on 3/9/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import "GUIBoard.h"
<<<<<<< HEAD
#import "FunnelFoursViewController.h"
=======
>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9


@implementation GUIBoard

<<<<<<< HEAD
@synthesize radius, rowHeight, outerPadding, lineWidth, centerx, centery;
@synthesize fillColor, lineColor;
@synthesize controller;

float toRad(float);
=======
>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
-(void) awakeFromNib
{
<<<<<<< HEAD
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
	
=======
	radius = 153;
	rowHeight = 25;
	lineWidth = 5;
	outerPadding = 5;
	centerx = centery = 153;
	angleShift = 0;
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	/*[UIView beginAnimations:@"test" context:NULL];
	angleShift+=.1;
	self.transform = CGAffineTransformMakeRotation(angleShift);
	count %= 10;
	count +=3;
	[UIView commitAnimations];*/
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[UIView beginAnimations:@"test" context:NULL];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	self.transform = CGAffineTransformMakeRotation(.8);
	[UIView commitAnimations];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint prev = [[touches anyObject] previousLocationInView:self];
	CGPoint next = [[touches anyObject] locationInView:self];
	CGPoint relativePrev;
	relativePrev.x = centerx-prev.x;
	relativePrev.y = centery-prev.y;
	CGPoint relativeNext;
	relativeNext.x = centerx-next.x;
	relativeNext.y = centery-next.y;
	if(sqrt(relativeNext.x*relativeNext.x+relativeNext.y*relativeNext.y)>radius)
		return;
	float length = sqrt(relativeNext.x*relativeNext.x+relativeNext.y*relativeNext.y)*sqrt(relativePrev.x*relativePrev.x+relativePrev.y*relativePrev.y);
	if(length<3)
		return;
	float dot = (relativePrev.x*relativeNext.x+relativePrev.y*relativeNext.y)/(length);
	dot = dot<1 ? dot : 1;
	float angle = acos(dot);
	float cross = (relativePrev.x*(next.y-prev.y))-(relativePrev.y*(next.x-prev.x));
	if(cross>0)
		angle = -angle;
	NSLog(@"Angle %f",angle);
	NSLog(@"length %f",length);
	NSLog(@"Current Location = %@",NSStringFromCGPoint(next));
	NSLog(@"Dot : %f",dot);
	angleShift+=angle;
	self.transform = CGAffineTransformMakeRotation(angleShift);
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextSetLineWidth(context, lineWidth);
	CGContextAddArc(context, centerx, centery, radius-outerPadding, 0, 8, 0);
	CGContextFillPath(context);
	
	CGContextAddArc(context, centerx, centery, radius-outerPadding, 0, 8, 0);
	
	CGContextMoveToPoint(context, centerx+radius-outerPadding-1*rowHeight, centery);
	CGContextAddArc(context, centerx, centery, radius-outerPadding-1*rowHeight, 0, 8, 0);
	
	CGContextMoveToPoint(context, centerx+radius-outerPadding-2*rowHeight, centery);
	CGContextAddArc(context, centerx, centery, radius-outerPadding-2*rowHeight, 0, 8, 0);
	
	CGContextMoveToPoint(context, centerx+radius-outerPadding-3*rowHeight, centery);
	CGContextAddArc(context, centerx, centery, radius-outerPadding-3*rowHeight, 0, 8, 0);
	
	CGContextMoveToPoint(context, centerx+radius-outerPadding-4*rowHeight, centery);
	CGContextAddArc(context, centerx, centery, radius-outerPadding-4*rowHeight, 0, 8, 0);
	
	CGContextMoveToPoint(context, centerx+radius-outerPadding-5*rowHeight, centery);
	CGContextAddArc(context, centerx, centery, radius-outerPadding-5*rowHeight, 0, 8, 0);
	
	CGContextMoveToPoint(context, centerx, centery-radius+outerPadding);
	CGContextAddLineToPoint(context, centerx, centery+radius-outerPadding);
	
	CGContextMoveToPoint(context, centerx-radius+outerPadding, centery);
	CGContextAddLineToPoint(context, centerx+radius-outerPadding, centery);
	
	CGContextMoveToPoint(context, centerx-(radius-outerPadding)/sqrt(2), centery-(radius-outerPadding)/sqrt(2));
	CGContextAddLineToPoint(context, centerx+(radius-outerPadding)/sqrt(2), centery+(radius-outerPadding)/sqrt(2));
	
	CGContextMoveToPoint(context, centerx-(radius-outerPadding)/sqrt(2), centery+(radius-outerPadding)/sqrt(2));
	CGContextAddLineToPoint(context, centerx+(radius-outerPadding)/sqrt(2), centery-(radius-outerPadding)/sqrt(2));
	
	
	
	CGContextStrokePath(context);
	
	CGContextMoveToPoint(context, centerx+radius-outerPadding-5*rowHeight-lineWidth/2., centery);
	CGContextAddArc(context, centerx, centery, radius-outerPadding-5*rowHeight-lineWidth/2., 0, 8, 0);
	CGContextFillPath(context);
>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9
}


- (void)dealloc {
    [super dealloc];
}


@end
