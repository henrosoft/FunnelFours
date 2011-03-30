//
//  Square.m
//  FunnelFours
//
//  Created by Henry Bradlow on 3/21/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import "Square.h"


@implementation Square
int const EMPTY = 0;
int const WHITE = 1;
int const BLACK = 2;

@synthesize r1,r2,a1,a2,aid,rid,piece,r2max;

-(id) initWithRadius1:(float)rad1 Radius2:(float)rad2 
			   Angle1:(float)ang1 Angle2:(float)ang2 
				  AID:(int)angid RID:(int)radid
{
	r1 = rad1;
	r2 = rad2;
	a1 = ang1;
	a2 = ang2;
	aid = angid;
	rid = radid;
	piece = EMPTY;
	return self;
}
-(BOOL) isEqual:(id)object
{
	NSLog(@"in checker");
	Square* s = (Square*)object;
	return s.aid==aid && s.rid==rid;
}
-(NSString*) description
{
	return [NSString stringWithFormat:@"RID: %i, AID: %i",rid,aid];
}
@end
