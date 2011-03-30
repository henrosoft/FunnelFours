//
//  PieceHolder.m
//  FunnelFours
//
//  Created by Henry Bradlow on 3/19/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import "PieceHolder.h"
#import "FunnelFoursViewController.h"

@implementation PieceHolder

@synthesize controller;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}
-(void) awakeFromNib
{
	holderPadding = 2;
}
- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGColorRef color = [[controller boardModel] playerTurn]==BLACK ? [UIColor blackColor].CGColor : [UIColor whiteColor].CGColor;
	CGContextSetFillColorWithColor(context, color);
    [[controller boardView] fillSquareWithContext:context startAngle:(M_PI*3/2)-(M_PI/16.-.02) endAngle:(M_PI*3/2)+(M_PI/16.-.02) 
										   startR:[[controller boardView] radius]-[[controller boardView] outerPadding]+holderPadding 
											 endR:[[controller boardView] radius]+[[controller boardView] rowHeight]-[[controller boardView] outerPadding]+holderPadding];
}

- (void)dealloc {
    [super dealloc];
}


@end
