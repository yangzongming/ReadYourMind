//
//  AppsInfoView.h
//  iPadReader
//
//  Created by Tim Chan on 03/07/2010.
//  Copyright 2010 Tim Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "GANTracker.h"
#import "constant.h"

@interface AppsInfoView : UIView {
	UIImageView *iconView;
	UIImageView *discountView;
	UILabel *appTitleLabel;
	UIButton *btnPrice;	
	NSString *appStoreLink;
}
-(void) openAppStore;
@property (nonatomic, retain) NSString *appStoreLink;
@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, retain) UILabel *appTitleLabel;
@property (nonatomic, retain) UIButton *btnPrice;
@property (nonatomic, retain) UIImageView *discountView;
-(void)analysis:(NSString *)folder;
@end
