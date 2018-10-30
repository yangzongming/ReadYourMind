//
//  HeartCard.m
//  ReadYourHeart
//
//  Created by apple007 on 09-12-5.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "HeartCard.h"


@implementation HeartCard
@synthesize button;
@synthesize label;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		
		[self setBackgroundColor:[UIColor redColor]];
		self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 80)];
		[label setBackgroundColor:[UIColor clearColor]];
		[label setTextAlignment:UITextAlignmentCenter];
		[label setFont:[UIFont boldSystemFontOfSize:22]];
		[self addSubview:label];
		
		self.button = [[UIButton alloc] initWithFrame:CGRectMake(30, 20, 40, 40)];
		[button setBackgroundColor:[UIColor clearColor]];
		//[button setImage:[UIImage imageNamed:@"p.png"] forState:UIControlStateNormal];
		[button setUserInteractionEnabled:NO];
		[self addSubview:button];
    }
    return self;
}

-(void)setLabelText:(NSString *)text
{
	[self.label setText:text];
}
-(void)setButtonImage:(UIImage *)image
{
	[self.button setBackgroundImage:image forState:UIControlStateNormal];
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[label release];
	[button release];
    [super dealloc];
}


@end
