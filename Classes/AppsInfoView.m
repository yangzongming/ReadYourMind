//
//  AppsInfoView.m
//  iPadReader
//
//  Created by Tim Chan on 03/07/2010.
//  Copyright 2010 Tim Chan. All rights reserved.
//

#import "AppsInfoView.h"


@implementation AppsInfoView
@synthesize iconView;
@synthesize appTitleLabel;
@synthesize btnPrice;
@synthesize appStoreLink;
@synthesize discountView;
//H 100px x 192 px
- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		iconView=[[UIImageView alloc] initWithFrame:CGRectMake(-2, 10, 64, 64)];
		[self addSubview:iconView];
		
				
		appTitleLabel=[[UILabel alloc] initWithFrame:CGRectMake( 62, 11, 78, 60)];
		appTitleLabel.backgroundColor=[UIColor clearColor];
		appTitleLabel.font=[UIFont systemFontOfSize:8];
		appTitleLabel.numberOfLines=3;
		[self addSubview:appTitleLabel];
		

		btnPrice=[[UIButton alloc] initWithFrame:CGRectMake(60, 44, 80, 31)];
		btnPrice.titleLabel.font=[UIFont boldSystemFontOfSize:10];
		[btnPrice addTarget:self action:@selector(openAppStore) forControlEvents:UIControlEventTouchUpInside];
		[btnPrice setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[btnPrice setBackgroundImage:[UIImage imageNamed:@"button_price.png"] forState:UIControlStateNormal];
		[btnPrice setTitle:@"US24.99" forState:UIControlStateNormal];
		[self addSubview:btnPrice];
		
		//discountView=[[UIImageView alloc] initWithFrame:CGRectMake(140, 35, 33, 33)];
		//[self addSubview:discountView];
    }
    return self;
}

-(void) openAppStore
{
	//NSLog(@"appStoreLink=%@",appStoreLink);
	if (appStoreLink){
		[self analysis:[NSString stringWithFormat:@"/%@_OpenAppStore",kBundleID]];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:appStoreLink]];
	}
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
	
	//NSLog(@"iconView %@ dealloc", self);
	[discountView release];
	[appStoreLink release];
	[appTitleLabel release];
	[iconView release];
	[btnPrice release];
    [super dealloc];
}
#pragma mark google
-(void)analysis:(NSString *)folder{
	
/*
	NSError *error;
	if (![[GANTracker sharedTracker] trackPageview:[NSString stringWithFormat:@"%@",folder] withError:&error]) {
		// Handle error here
		//NSLog(@"trackPageview Error");
	}
	else {
		//NSLog(@"trackPageview Success");
		
	}
*/
}

@end
