//
//  Square.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/21/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import <Foundation/Foundation.h>
extern int const EMPTY;
extern int const WHITE;
extern int const BLACK;

@interface Square : NSObject {
	float r1,r2,a1,a2,r2max;
	int aid,rid;
	int piece;
}
-(id)initWithRadius1:(float)r1 Radius2:(float)r2 
			  Angle1:(float)a1 Angle2:(float)a2 
				 AID:(int)aid RID:(int)rid;
@property(nonatomic,readonly) float r1,a1,a2;
@property(nonatomic,readonly) int aid,rid;
@property(nonatomic,readwrite) int piece;
@property(nonatomic,readwrite) float r2max, r2;
@end
