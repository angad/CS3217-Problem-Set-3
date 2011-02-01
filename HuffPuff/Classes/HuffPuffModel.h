//
//  HuffPuffModel.h
//  HuffPuff
//
//  Created by Angad Singh on 1/28/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HuffPuffStorage.h"

@interface HuffPuffModel : NSObject {
	//stores the game area UIView objects
	NSMutableArray *gamearea;
	//stores the palette UIView objects
	NSMutableArray *palette;
}

-(void)addGameAreaObject:(UIImageView*)obj;
-(void)remGameAreaObject:(UIImageView*)obj;
-(void)addPaletteObject:(UIImageView*)obj;
-(void)remPaletteObject:(UIImageView*)obj;
-(void)writeToFile;
-(NSMutableArray*)loadFile:(NSString *)file;

@end
