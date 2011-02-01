//
//  HuffPuffViewController.h
//  HuffPuff
//
//  Created by Angad Singh on 1/27/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HuffPuffPig.h"
#import "HuffPuffWolf.h"
#import "HuffPuffBlock.h"
#import "HuffPuffController.h"
#import "HuffPuffModel.h"


@interface HuffPuffViewController : UIViewController {
	IBOutlet UIScrollView *gamearea;
	IBOutlet UIView *palette;
	
	//for the First screen
	HuffPuffPig *p;
	HuffPuffWolf *w;
	HuffPuffBlock *b;	
}

- (IBAction)buttonPressed:(UIButton *)sender;

@end