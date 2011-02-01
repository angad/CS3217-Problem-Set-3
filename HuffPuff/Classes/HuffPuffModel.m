//
//  HuffPuffModel.m
//  HuffPuff
//
//  Created by Angad Singh on 1/28/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "HuffPuffModel.h"

@implementation HuffPuffModel

-(id)init
{
	gamearea = [NSMutableArray array];
	palette = [NSMutableArray array];
	return self;
}

-(void)addGameAreaObject:(UIImageView*)obj{
	[gamearea addObject:obj];
}
-(void)remGameAreaObject:(UIImageView*)obj{
	[gamearea removeObject:obj];
}
-(void)addPaletteObject:(UIImageView*)obj{
	[palette addObject:obj];
}
-(void)remPaletteObject:(UIImageView*)obj{
	[palette removeObject:obj];
}

-(void)writeToFile{
	[HuffPuffStorage writeToFile:gamearea :@"gamearea"];
	[HuffPuffStorage writeToFile:palette :@"palette"];
}

-(NSMutableArray*)loadFile:(NSString*)file
{
	return [HuffPuffStorage loadFile:file];
}

@end
