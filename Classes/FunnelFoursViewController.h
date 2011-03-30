//
//  FunnelFoursViewController.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/8/11.
//  Copyright Westview High School 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GUIBoard.h"
#import "BoardModel.h"
#import "PieceHolder.h"

@interface FunnelFoursViewController : UIViewController {
	IBOutlet GUIBoard *boardView;
	IBOutlet PieceHolder *holder;
	BoardModel *boardModel;
	IBOutlet UILabel *helpSettings;
}
-(void) playClick;
-(void) playFrog;
-(void) playWaterDrop;
-(void) rotateBoardBy:(float)angle;
@property(nonatomic,retain) PieceHolder *holder;
@property(nonatomic,retain) BoardModel* boardModel;
@property(nonatomic,retain) GUIBoard* boardView;
@end

