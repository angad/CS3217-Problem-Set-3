//
//  HuffPuffPig.m
//  HuffPuff
//
//  Created by Angad Singh on 1/28/11.
//  Copyright 2011 NUS. All rights reserved.
//
#import "HuffPuffPig.h"
#import "HuffPuffViewController.h"

@implementation HuffPuffPig

@synthesize pig, objectType, gamearea, xy, angle, scale, palette, image;

-(id)initPath:(NSString*)img gamearea:(UIScrollView*)g palette:(UIView*)p
{
	[super init];
	
	//setting the basic details
	xy = CGPointMake(0.0, 0.0);
	angle = 0.0;
	scale = 0.0;
	objectType = kGameObjectPig;
	image = [UIImage imageNamed:img];
	pig = [[UIImageView alloc] initWithImage:image];
	
	//using tag to store objecttype information
	pig.tag = @"pig.png";
	pig.userInteractionEnabled = YES;
	pig.frame = CGRectMake(10, 10, 55, 55);
	frame = pig.frame;
	flag = 0;
	gamearea = g;
	palette = p;
	
	//attaching Pan Gesture recognizer
	UIPanGestureRecognizer *pigPan =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(translate:)];
	[pig addGestureRecognizer:pigPan];
	
	return self;
}

-(id)initWithView:(UIImageView*)obj gamearea:(UIScrollView*)g palette:(UIView*)p
{
	[super init];
	
	pig = obj;
	pig.userInteractionEnabled = YES;
	frame = pig.frame;
	flag = 0;
	gamearea = g;
	palette = p;
	
	UIPanGestureRecognizer *pigPan =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(translate:)];
	[pig addGestureRecognizer:pigPan];
	
	return self;
}

-(void)translate:(UIGestureRecognizer *)gesture
{
	if (flag==0)
	{
		if ([gamearea pointInside:pig.frame.origin withEvent:nil])
		{
			//when the object enters the gamearea, add it to that
			[gamearea addSubview:gesture.view];
		}
		UIRotationGestureRecognizer *pigRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
		UIPinchGestureRecognizer *pigPinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(zoom:)];
		UITapGestureRecognizer *pigTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
		pigTap.numberOfTapsRequired = 2;
		[pig addGestureRecognizer:pigTap];
		[pig addGestureRecognizer:pigRotate];
		[pig addGestureRecognizer:pigPinch];
		
		//the size of the pig
		gesture.view.frame = CGRectMake(gesture.view.frame.origin.x, gesture.view.frame.origin.y, 88, 88);
		flag = 1;
	}
	[super translate:gesture];
}

-(void)doubleTap:(UIGestureRecognizer*)gesture
{
	HuffPuffPig *newPig = [[HuffPuffPig alloc] initPath:@"pig.png" gamearea:gamearea palette:palette];
	[palette addSubview:[newPig pig]];
	[gesture.view removeFromSuperview];
}

@end
