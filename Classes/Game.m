//
//  Game.m
//  Read
//
//  Created by apple007 on 09-12-10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Game.h"


@implementation Game
@synthesize subView;
@synthesize mainSysmbols;
@synthesize mainBall;
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		//[[NSBundle mainBundle] loadNibNamed:@"Game" owner:self options:nil];
		//[self addSubview:subView];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[mainSysmbols release];
	[mainBall release];
	[subView release];
    [super dealloc];
}


@end
