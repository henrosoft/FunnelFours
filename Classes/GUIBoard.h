//
//  GUIBoard.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/9/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GUIBoard : UIView {
	int radius, rowHeight, outerPadding, lineWidth;
	int centerx, centery;
	float angleShift;
	float angleVelocity;
}
@end
