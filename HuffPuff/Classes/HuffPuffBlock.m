//
//  HuffPuffBlock.m
//  HuffPuff
//
//  Created by Angad Singh on 1/28/11.
//  Copyright 2011 NUS. All rights reserved.
//
#import "HuffPuffBlock.h"


@implementation HuffPuffBlock

@synthesize xy, angle, scale, block, objectType, gamearea, palette, image;


-(id)initPath:(NSString*)img gamearea:(UIScrollView*)g palette:p
{
	xy = CGPointMake(0.0, 0.0);
	angle = 0.0;
	scale = 0.0;
	objectType = kGameObjectBlock;
	image = [UIImage imageNamed:img];
	block = [[UIImageView alloc] initWithImage:image];
	block.tag = @"block1.png";
	block.userInteractionEnabled = YES;
	block.frame = CGRectMake(200, 10, 50, 50);
	counter = 1;
	gamearea = g;
	palette = p;
	
	UIPanGestureRecognizer *blockPan =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(translate:)];
	UITapGestureRecognizer *blockTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];

	[block addGestureRecognizer:blockTap];
	[block addGestureRecognizer:blockPan];
	return self;
}

-(id)initWithView:(UIImageView*)obj gamearea:(UIScrollView*)g palette:(UIView*)p
{
	[super init];
	
	block = obj;
	block.userInteractionEnabled = YES;
	frame = block.frame;
	flag = 0;
	gamearea = g;
	palette = p;
	
	UIPanGestureRecognizer *blockPan =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(translate:)];
	[block addGestureRecognizer:blockPan];
	
	return self;
}

-(void)translate:(UIGestureRecognizer *)gesture
{
	if (flag==0) {
		
		if ([block.superview pointInside:block.frame.origin withEvent:nil])
		{
			[gamearea addSubview:gesture.view];
			
			//regenerating the block in the palette
			HuffPuffBlock *newBlock = [[HuffPuffBlock alloc] initPath:@"block1.png" gamearea:gamearea palette:palette];
			[palette addSubview:[newBlock block]];
		}		
		UIRotationGestureRecognizer *blockRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
		UIPinchGestureRecognizer *blockPinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(zoom:)];
		UITapGestureRecognizer *blockDoubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
		blockDoubleTap.numberOfTapsRequired = 2;
		[block addGestureRecognizer:blockDoubleTap];
		[block addGestureRecognizer:blockRotate];
		[block addGestureRecognizer:blockPinch];
		gesture.view.frame = CGRectMake(gesture.view.frame.origin.x, gesture.view.frame.origin.y, 30, 130);
		flag = 1;
	}
	[super translate:gesture];
}

-(void)tap:(UIGestureRecognizer*)gesture
{	
	NSMutableArray *images = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"block1.png"],
							  [NSString stringWithFormat:@"block2.png"],
							  [NSString stringWithFormat:@"block3.png"],
							  [NSString stringWithFormat:@"block4.png"],nil];
	UIImage *image = [UIImage imageNamed:[images objectAtIndex:counter]];
	//NSLog(@"Tapped %@", [images objectAtIndex:counter]);
	
	[block setTag:[images objectAtIndex:counter]];
	counter++;
	if (counter == 4) {
		counter = 0;
	}
	[block setImage:image];
}

-(void)doubleTap:(UIGestureRecognizer*)gesture
{
	[gesture.view removeFromSuperview];
}


@end;