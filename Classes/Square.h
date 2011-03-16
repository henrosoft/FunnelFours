//
//  Square.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/11/11.
//  Copyright 2011 Westview High School. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Square : NSObject {
	int rid, aid;
}
-(id)initWithRid:(int) rid
		andAid:(int) aid;
@end
