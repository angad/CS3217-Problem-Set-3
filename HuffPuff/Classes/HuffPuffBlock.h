//
//  HuffPuffBlock.h
//  HuffPuff
//
//  Created by Angad Singh on 1/28/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HuffPuffGameObject.h"

@interface HuffPuffBlock : HuffPuffGameObject
{
	CGPoint xy;
	CGFloat angle;
	CGFloat scale;
	CGRect frame;
	UIImageView *block;
	UIScrollView *gamearea;
	UIView *palette;
	UIImage *image;
	int flag;
	int counter;
}
@property (readonly) CGPoint xy;
@property (readonly) CGFloat angle;
@property (readonly) CGFloat scale;
@property (readonly) UIImageView *block;
@property (readonly) UIScrollView *gamearea;
@property (readonly) UIView *palette;
@property (readonly) UIImage *image;


-(id)initPath:(NSString *)img gamearea:(UIScrollView *)g palette:(UIView*)p;



@end
