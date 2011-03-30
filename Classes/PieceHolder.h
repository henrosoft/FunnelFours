//
//  PieceHolder.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/19/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FunnelFoursViewController;

@interface PieceHolder : UIView {
	FunnelFoursViewController *controller;
	int holderPadding;
}



@property(nonatomic,retain, readwrite) FunnelFoursViewController* controller;
@end
