//
//  HuffPuffPig.h
//  HuffPuff
//
//  Created by Angad Singh on 1/28/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HuffPuffGameObject.h"

@interface HuffPuffPig : HuffPuffGameObject{	

	CGPoint xy;
	CGFloat angle;
	CGFloat scale;
	CGRect frame;
	UIImageView *pig;
	UIScrollView *gamearea;
	UIImage *image;
	UIView *palette;
	int flag;	
}

@property (readonly) UIImageView *pig;
@property (readonly) UIScrollView *gamearea;
@property (readonly) UIView *palette;
@property (readonly) UIImage *image;
@property (readonly) CGPoint xy;
@property (readonly) CGFloat angle;
@property (readonly) CGFloat scale;

-(id)initPath:(NSString *)img gamearea:(UIScrollView *)g palette:(UIView*)p;
-(id)initWithView:(UIImageView*)obj gamearea:(UIScrollView*)g palette:(UIView*)p;

@end
