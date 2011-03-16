//
//  GUIBoard.m
//  FunnelFours
//
//  Created by Henry Bradlow on 3/9/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import "GUIBoard.h"


@implementation GUIBoard


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
-(void) awakeFromNib
{
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
}


- (void)dealloc {
    [super dealloc];
}


@end
