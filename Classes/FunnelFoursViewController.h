//
//  FunnelFoursViewController.h
//  FunnelFours
//
//  Created by Henry Bradlow on 3/8/11.
//  Copyright Westview High School 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GUIBoard.h"
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
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
<<<<<<< HEAD
=======
=======

@interface FunnelFoursViewController : UIViewController {
	IBOutlet GUIBoard *board;
}

>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
@end

