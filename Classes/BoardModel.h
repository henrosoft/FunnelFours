//
//  BoardModel.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/18/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"

@class FunnelFoursViewController;
@interface BoardModel : NSObject {
	float angleShift, trueAngle, gripFactor, angleSpeed;
	int currentCol;
	FunnelFoursViewController *controller;
	NSSet* squares;
	int radius, rowHeight, outerPadding, lineWidth, centerx, centery, playerTurn;
	BOOL glide;
}
-(id) initWithController:(FunnelFoursViewController*)control;
-(void) update;
-(NSSet *) makeBoard;
-(Square*) lowestSquareInCol:(int)col;
-(void) makeMove;
-(void) paintSquareWithSquare:(Square *)square;
-(void) paintSquares;
-(void) doGlide;
-(void) animateSquare:(NSTimer *)timer;

@property(nonatomic, readwrite) float angleShift, trueAngle, gripFactor, angleSpeed;
@property(nonatomic, readwrite) int currentCol, playerTurn;
@property(nonatomic, readonly) int radius, rowHeight, outerPadding, lineWidth, centerx, centery;
@property(nonatomic,readwrite) BOOL glide;
@end
