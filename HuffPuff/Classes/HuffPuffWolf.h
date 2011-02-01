//
//  HuffPuffWolf.h
//  HuffPuff
//
//  Created by Angad Singh on 1/28/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HuffPuffGameObject.h"

@interface HuffPuffWolf : HuffPuffGameObject
{
	CGPoint xy;
	CGFloat angle;
	CGFloat scale;
	UIImageView *wolf;
	UIScrollView *gamearea;
	UIView *palette;
	UIImage *image;
	CGRect frame;
	int flag;
}

@property (readonly) CGPoint xy;
@property (readonly) CGFloat angle;
@property (readonly) CGFloat scale;
@property (readonly) UIImageView *wolf;
@property (readonly) UIScrollView *gamearea;
@property (readonly) UIView *palette;
@property (readonly) UIImage *image;

-(id)initPath:(NSString *)img gamearea:(UIScrollView *)g palette:(UIView*)p;


@end
