//
//  HuffPuffViewController.m
//  HuffPuff
//
//  Created by Angad Singh on 1/27/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "HuffPuffViewController.h"

@implementation HuffPuffViewController

const CGFloat backgroundWidth = 1600.0; 
const CGFloat backgroundHeight = 480.0; 
const CGFloat groundWidth = 1600; 
const CGFloat groundHeight = 100.0;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


//setup the basic game details
-(void)envSetup{
	
	//load the images into UIImage objects
	UIImage *bgImage = [UIImage imageNamed:@"background.png"]; 
	UIImage *groundImage = [UIImage imageNamed:@"ground.png"];
	
	//place each of them in an UIImageView 
	UIImageView *background = [[UIImageView alloc] initWithImage:bgImage];
	UIImageView *ground = [[UIImageView alloc] initWithImage:groundImage];
	CGFloat groundY = gamearea.frame.size.height - groundHeight; 
	CGFloat backgroundY = groundY - backgroundHeight;
	
	//the frame property holds the position and size of the views 
	//the CGRectMake method’s arguments are : x position, y position, width, 
	//height 
	background.frame = CGRectMake(0, backgroundY, backgroundWidth, backgroundHeight); 
	ground.frame = CGRectMake(0, groundY, groundWidth, groundHeight);
	
	//add these views as subviews of the gamearea. gamearea will retain them 
	[gamearea addSubview:background]; 
	[gamearea addSubview:ground];
	
	//set the content size so that gamearea is scrollable 
	//otherwise it defaults to the current window size 
	CGFloat gameareaHeight = backgroundHeight + groundHeight; 
	CGFloat gameareaWidth = backgroundWidth;
	[gamearea setContentSize:CGSizeMake(gameareaWidth, gameareaHeight)];
	
	[background release];
	[ground release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad { 
	
	[super viewDidLoad];
	
	int i;
	for(i=0; i<[[gamearea subviews]count]; i++)
	{
		[[[gamearea subviews]objectAtIndex:i] removeFromSuperview];
	}
	
	for (i=0; i<[[palette subviews]count]; i++) {
		[[[palette subviews]objectAtIndex:i] removeFromSuperview];
	}
	
	[self envSetup];

	
//------Game Objects initialization------//

	p = [[HuffPuffPig alloc] initPath:@"pig.png" gamearea:gamearea palette:palette];
	b = [[HuffPuffBlock alloc]initPath:@"block1.png" gamearea:gamearea palette:palette];
	w = [[HuffPuffWolf alloc]initPath:@"wolfs.png" gamearea:gamearea palette:palette];
		
	//adding UIImageViews to palette
	[palette addSubview:[p pig]];
	[palette addSubview:[w wolf]];
	[palette addSubview:[b block]];
}

-(void)save{
	
	HuffPuffModel *model = [[[HuffPuffModel alloc]init]autorelease];
	
	int i;
	for(i=0; i<[[gamearea subviews]count]; i++)
	{
		[model addGameAreaObject:[[gamearea subviews]objectAtIndex:i]];
	}
	for (i=0; i<[[palette subviews]count]; i++) {
		[model addPaletteObject:[[palette subviews]objectAtIndex:i]];
	}
	
	[model writeToFile];
}

-(void)load{
	
	
	//temporary arrays to hold the gamearea and the palette objects which are loaded from the file
	NSMutableArray *game = [NSMutableArray array];
	NSMutableArray *pale = [NSMutableArray array];
	
	HuffPuffModel *model = [[HuffPuffModel alloc]init];
	
	game = [model loadFile:@"gamearea"];
	pale = [model loadFile:@"palette"];
	
	
	//removing all the objects from the gamearea and the palette
	int i;
	for(i=0; i<[[gamearea subviews]count]; i++)
	{
		[[[gamearea subviews]objectAtIndex:i] removeFromSuperview];
	}
	
	for (i=0; i<[[palette subviews]count]; i++) {
		[[[palette subviews]objectAtIndex:i] removeFromSuperview];
	}
	
	//adding the objects loaded from the file
	for (i=0; i<[game count]; i++) 
	{
		NSString *str = [[game objectAtIndex:i]tag];
		
		if ([str isEqual:@"pig.png"]) {
			p = [[HuffPuffPig alloc] initWithView:[game objectAtIndex:i] gamearea:gamearea palette:palette];
			[gamearea addSubview:[p pig]];
			NSLog(@"Pig added to gamearea");
		}

		else if ([str isEqual:@"block1.png"] ) {
			b = [[HuffPuffBlock alloc] initWithView:[game objectAtIndex:i] gamearea:gamearea palette:palette];
			[gamearea addSubview:[b block]];
			NSLog(@"Block added to gamearea");
		}
		
		else if ([str isEqual:@"wolf.png"]) {
			p = [[HuffPuffWolf alloc] initWithView:[game objectAtIndex:i] gamearea:gamearea palette:palette];
			[gamearea addSubview:[w wolf]];
			NSLog(@"Wolf added to gamearea");
		}
		
		else [gamearea addSubview:[game objectAtIndex:i]];
	}
	
	for (i=0; i<[pale count]; i++) 
	{
		NSString *str = [[pale objectAtIndex:i]tag];
		if ([str isEqual:@"pig.png"]) {
			p = [[HuffPuffPig alloc] initWithView:[pale objectAtIndex:i] gamearea:gamearea palette:palette];
			[palette addSubview:[p pig]];
			NSLog(@"Pig added to palette");
		}
		
		else if ([str isEqual:@"block1.png"]) {
			b = [[HuffPuffBlock alloc] initWithView:[pale objectAtIndex:i] gamearea:gamearea palette:palette];
			[palette addSubview:[b block]];
			NSLog(@"Block added to palette");
		}
		
		else if ([str isEqual:@"wolf.png"]) {
			p = [[HuffPuffWolf alloc] initWithView:[pale objectAtIndex:i] gamearea:gamearea palette:palette];
			[palette addSubview:[w wolf]];
			NSLog(@"Wolf added to palette");
		}
		
		else [palette addSubview:[pale objectAtIndex:i]];
	}
}

-(void)reset{
	//reset
	[self viewDidLoad];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

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
}


- (IBAction)buttonPressed:(UIButton *)sender { 
	NSString *buttonTitle = [[sender titleLabel] text];

	if ([buttonTitle isEqual:@"Save"]) {
		[self save];
	}
	if ([buttonTitle isEqual:@"Load"]) {
		[self load];
	}
	if ([buttonTitle isEqual:@"Reset"]) {
		[self reset];
	}
}
	
@end
