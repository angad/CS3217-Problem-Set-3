//
//  HuffPuffWolf.m
//  HuffPuff
//
//  Created by Angad Singh on 1/28/11.
//  Copyright 2011 NUS. All rights reserved.
//
#import "HuffPuffWolf.h"


@implementation HuffPuffWolf

@synthesize angle, xy, scale, wolf, gamearea, objectType, palette, image;

-(id)initPath:(NSString*)img gamearea:(UIScrollView*)g palette:(UIView*)p
{
	//Getting wolfImage from sprite
	xy = CGPointMake(0.0, 0.0);
	angle = 0.0;
	scale = 0.0;
	
	CGImageRef imageToSplit = [UIImage imageNamed:img].CGImage;
	CGImageRef partOfImageAsCG = CGImageCreateWithImageInRect(imageToSplit, CGRectMake(0, 0, 225, 150));
	image = [UIImage imageWithCGImage:partOfImageAsCG];
	wolf = [[UIImageView alloc] initWithImage:image];
	wolf.userInteractionEnabled = YES;
	wolf.frame = CGRectMake(100, 10, 50, 50);
	palette = p;
	flag =0;
	gamearea = g;
	objectType = kGameObjectWolf;
	wolf.tag = @"wolf.png";
	
	UIPanGestureRecognizer *wolfPan =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(translate:)];
	[wolf addGestureRecognizer:wolfPan];
	
		return self;
}

-(id)initWithView:(UIImageView*)obj gamearea:(UIScrollView*)g palette:(UIView*)p
{
	[super init];
	
	wolf = obj;
	wolf.userInteractionEnabled = YES;
	frame = wolf.frame;
	flag = 0;
	gamearea = g;
	palette = p;
	
	UIPanGestureRecognizer *wolfPan =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(translate:)];
	[wolf addGestureRecognizer:wolfPan];
	
	return self;
}

-(void)translate:(UIGestureRecognizer *)gesture
{
	if (flag==0) {
		
		if ([wolf.superview pointInside:wolf.frame.origin withEvent:nil])
		{
			[gamearea addSubview:gesture.view];
		}
		
		UIRotationGestureRecognizer *wolfRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
		UIPinchGestureRecognizer *wolfPinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(zoom:)];
		UITapGestureRecognizer *wolfTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)] ;
		wolfTap.numberOfTapsRequired = 2;
		[wolf addGestureRecognizer:wolfTap];
		[wolf addGestureRecognizer:wolfRotate];
		[wolf addGestureRecognizer:wolfPinch];
		gesture.view.frame = CGRectMake(gesture.view.frame.origin.x, gesture.view.frame.origin.y, 225, 150);
		flag = 1;
	}
	[super translate:gesture];
}

-(void)doubleTap:(UIGestureRecognizer*)gesture
{
	HuffPuffWolf *newWolf = [[HuffPuffWolf alloc] initPath:@"wolfs.png" gamearea:gamearea palette:palette];
	[palette addSubview:[newWolf wolf]];
	
	[gesture.view removeFromSuperview];
}
@end;