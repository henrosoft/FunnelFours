//
//  FunnelFoursViewController.m
//  FunnelFours
//
//  Created by Henry Bradlow on 3/8/11.
//  Copyright Westview High School 2011. All rights reserved.
//

#import "FunnelFoursViewController.h"
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
#import <AudioToolbox/AudioToolbox.h>


@implementation FunnelFoursViewController

@synthesize holder;
@synthesize boardModel;
@synthesize boardView;
<<<<<<< HEAD
=======
=======

@implementation FunnelFoursViewController


>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/
-(void) awakeFromNib
{
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
	[boardModel setAngleSpeed:0];
	[boardModel setGlide:NO];
	if([boardView isInCenterButton:[touches anyObject]])
		[boardModel makeMove];
<<<<<<< HEAD
=======
=======
	
>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
}
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
-(GUIBoard*) boardView
{
	return boardView;
}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([boardView isInCenterButton:[touches anyObject]])
		return;
	//implements the ability to rotate the board by dragging
	CGPoint prev = [[touches anyObject] previousLocationInView:boardView];
	CGPoint next = [[touches anyObject] locationInView:boardView];
	//points relative to the center of the board
	CGPoint relativePrev;
	relativePrev.x = boardView.centerx-prev.x;
	relativePrev.y = boardView.centery-prev.y;
	CGPoint relativeNext;
	relativeNext.x = boardView.centerx-next.x;
	relativeNext.y = boardView.centery-next.y;
	//if outside the board, the do nothing
	if(sqrt(relativeNext.x*relativeNext.x+relativeNext.y*relativeNext.y)>boardView.radius)
		return;
	//the magnitude of the two relative vectors multiplied together - the right side of the dot product
	float length = sqrt(relativeNext.x*relativeNext.x+relativeNext.y*relativeNext.y)*sqrt(relativePrev.x*relativePrev.x+relativePrev.y*relativePrev.y);
	if(length<3)//if too close to the center, do nothing
		return;
	float dot = (relativePrev.x*relativeNext.x+relativePrev.y*relativeNext.y)/(length);//calculate the dot product of the two vectors
	dot = dot<1 ? dot : 1;//cap the dot product at 1, just in case some rounding makes the dot bigger than one - then acos gets screwed up
	float angle = acos(dot);//find the angle between the two vectors
	//fine the cross product of the delta vector and the relativePrev vector
	//to determine if the movement is cw or ccw
	float cross = (relativePrev.x*(next.y-prev.y))-(relativePrev.y*(next.x-prev.x));
	if(cross>0)//if it is ccw, then reverse the sign of the angle
		angle = -angle;
	boardModel.trueAngle+=angle;
	boardModel.angleSpeed = angle;
	//boardModel.angleSpeed = 3;
	[boardModel update];
}
-(void) rotateBoardBy:(float)angle
{
	boardView.transform = CGAffineTransformMakeRotation(angle);//apply the rotation to the transformation matrix
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[boardModel setGlide:YES];
}
-(void) playClick
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Tink" ofType:@"aiff"];
	SystemSoundID soundID;
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
	AudioServicesPlaySystemSound (soundID);
	[soundPath release];
}
-(void) playFrog
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Frog" ofType:@"aiff"];
	SystemSoundID soundID;
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
	AudioServicesPlaySystemSound (soundID);
	[soundPath release];
}
-(void) playWaterDrop
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Drop" ofType:@"aif"];
	SystemSoundID soundID;
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
	AudioServicesPlaySystemSound (soundID);
	[soundPath release];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	boardModel = [[BoardModel alloc] initWithController:self];
	self.view.backgroundColor = [UIColor colorWithRed:.3 green:.3 blue:.3 alpha:1];
	holder.controller=self;
	boardView.controller = self;
}
-(void) tick:(NSTimer*)timer
{
	[boardModel update];
	//[holder setNeedsDisplay];
	//[boardView setNeedsDisplay];
}
<<<<<<< HEAD
=======
=======


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/
>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
<<<<<<< HEAD
	[boardModel release];
=======
<<<<<<< HEAD
	[boardModel release];
=======
>>>>>>> 8c7377e458228e4a3cb14f7f406cff26863e08c9
>>>>>>> 0276375d9a41ac3e441ed75fb7a468110576155d
}

@end
