//
//  BoardModel.m
//  FunnelFours
//
//  Created by Henry Bradlow on 3/18/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import "BoardModel.h"
#import "FunnelFoursViewController.h"
#import "GUIBoard.h"

@implementation BoardModel

@synthesize angleShift, trueAngle, gripFactor, angleSpeed;
@synthesize currentCol, playerTurn;
@synthesize radius, rowHeight, outerPadding, lineWidth, centerx, centery;
@synthesize glide;

-(id) initWithController:(FunnelFoursViewController*)control
{
	angleShift = 0;
	trueAngle = 0;
	currentCol = 0;
	gripFactor = .05;
	controller = control;
	playerTurn = BLACK;
	currentCol = 12;
	
	centerx = [controller boardView].centerx;
	centery = [controller boardView].centery;
	radius = [controller boardView].radius;
	rowHeight = [controller boardView].rowHeight;
	NSLog(@"%i %i %i %i",centerx,centery,radius,rowHeight);
	squares = [self makeBoard];
	
	return self;
}
-(NSSet*) makeBoard
{
	NSMutableSet* set = [[NSMutableSet alloc] init];
	[set autorelease];	//5 rings of squares
	int pad = [[controller boardView] outerPadding];
	for(float i = 0; i<M_PI*2; i+=M_PI/4.)
	{
		Square *s = [[Square alloc] initWithRadius1:radius-rowHeight*5-pad Radius2:radius-rowHeight*4-pad 
											 Angle1:i Angle2:i+M_PI/4. AID:round(i/(M_PI/4.)) RID:0];
		[set addObject:s];
		[s release];
	}
	for(float i = 0; i<M_PI*2; i+=M_PI/4.)
	{
		Square *s = [[Square alloc] initWithRadius1:radius-rowHeight*4-pad Radius2:radius-rowHeight*3-pad
											 Angle1:i Angle2:i+M_PI/4. AID:round(i/(M_PI/4.)) RID:1];
		[set addObject:s];
		[s release];
	}
	for(float i = 0; i<M_PI*2; i+=M_PI/8.)
	{
		Square *s = [[Square alloc] initWithRadius1:radius-rowHeight*3-pad Radius2:radius-rowHeight*2-pad
											 Angle1:i Angle2:i+M_PI/8. AID:round(i/(M_PI/8.)) RID:2];
		[set addObject:s];
		[s release];
	}
	for(float i = 0; i<M_PI*2; i+=M_PI/8.)
	{
		Square *s = [[Square alloc] initWithRadius1:radius-rowHeight*2-pad Radius2:radius-rowHeight*1-pad 
											 Angle1:i Angle2:i+M_PI/8. AID:round(i/(M_PI/8.)) RID:3];
		[set addObject:s];
		[s release];
	}
	for(float i = 0; i<M_PI*2; i+=M_PI/8.)
	{
		Square *s = [[Square alloc] initWithRadius1:radius-rowHeight*1-pad Radius2:radius-rowHeight*0-pad
											 Angle1:i Angle2:i+M_PI/8. AID:round(i/(M_PI/8.)) RID:4];
		[set addObject:s];
		[s release];
	}
	
	return [[NSSet alloc] initWithSet:set];
}
-(void) makeMove
{
	Square *s;
	if(s = [self lowestSquareInCol:currentCol])
	{
		[s setPiece:playerTurn];
		[s setR2max:[s r2]];
		[s setR2:[s r1]];
		[NSTimer scheduledTimerWithTimeInterval:1./60. target:self selector:@selector(animateSquare:)
									   userInfo:s repeats:YES];
		
		//[controller playFrog];
		[controller playWaterDrop];
		playerTurn = playerTurn==BLACK ? WHITE : BLACK;
		[self update];
	}
}
-(void) animateSquare:(NSTimer*)timer
{
	Square* s = (Square*)[timer userInfo];
	if([s r2]<[s r2max])
		[s setR2:[s r2]+1];
	else
		[timer invalidate];
	[[controller holder] setNeedsDisplay];
	[[controller boardView] setNeedsDisplay];
}
-(void) paintSquareWithSquare:(Square*)square
{
	[[controller boardView] fillSquareWithColor:(square.piece==BLACK ? [UIColor blackColor] : [UIColor whiteColor]) 
									 startAngle:square.a1 endAngle:square.a2 
										 startR:square.r1 endR:square.r2];
	[[controller boardView] setNeedsDisplay];
	[[controller holder] setNeedsDisplay];
}
-(void) paintSquares
{
	NSEnumerator* iter = [squares objectEnumerator];
	Square* temp;
	while(temp=[iter nextObject])
		if(temp.piece!=EMPTY)
			[self paintSquareWithSquare:temp];
}
-(Square*) lowestSquareInCol:(int)col
{
	Square *temp;
	NSEnumerator* iter = [squares objectEnumerator];
	int low = 5;
	Square *ans = nil;
	while(temp = [iter nextObject])
	{
		if(temp.rid == 0 && temp.piece==EMPTY && temp.aid==(int)(col/2.))
			{
				ans = temp;
				low = 0;
			}
		else if(temp.rid == 1 && temp.piece==EMPTY && temp.aid==(int)(col/2.) && low>0)
			{
				ans = temp;
				low = 1;
			}
		else if(temp.rid == 2 && temp.piece==EMPTY && temp.aid==col && low>1)
			{
				ans = temp;
				low = 2;
			}
		else if(temp.rid == 3 && temp.piece==EMPTY && temp.aid==col && low>2)
			{
				ans = temp;
				low = 3;
			}
		else if(temp.rid == 4 && temp.piece==EMPTY && temp.aid==col && low>3)
			{
				ans = temp;
				low = 4;
			}
	}
	return ans;
}
float normalizeAngle(float t)
{
	return fmod((fmod(t,M_PI*2) + M_PI*2), M_PI*2);
}
-(void) doGlide
{
	trueAngle += angleSpeed;
	if(angleSpeed<0)
		angleSpeed += .15/60.;
	if(angleSpeed>0)
		angleSpeed -= .15/60.;
	if(angleSpeed<.002 && angleSpeed>-.002)
		angleSpeed = 0;
}
-(void) update
{
	int oldCol = currentCol;
	
	if (glide) 
		[self doGlide];
	
	angleShift = trueAngle;
	currentCol = ((int)(fmod(normalizeAngle(-trueAngle),M_PI*2)/(M_PI*2)*16)+12)%16;
	
	float adjustedGrip = gripFactor;
	//if(angleSpeed==0)
	//	adjustedGrip = M_PI/12.;
	
	float closestClick = (int)(fmod(normalizeAngle(trueAngle),M_PI*2)/(M_PI*2)*16)*M_PI*2/16 + M_PI/16.;
	if(normalizeAngle(trueAngle)<closestClick+adjustedGrip && normalizeAngle(trueAngle)>closestClick-adjustedGrip)
	{
		angleShift = closestClick;
	}
	
	[controller rotateBoardBy:angleShift];
	
	if(oldCol!=currentCol)
		[controller playClick];
	
	NSEnumerator *iter = [squares objectEnumerator];
	Square *s;
	while(s = [iter nextObject])
		if(s.piece!=EMPTY)
			[self paintSquareWithSquare:s];
}
-(void) dealloc
{
	[super dealloc];
	[squares release];
}
@end
