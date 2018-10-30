//
//  HeartCard.h
//  ReadYourHeart
//
//  Created by apple007 on 09-12-5.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HeartCard : UIView {
	UILabel *label;
	UIButton *button;
}
@property (nonatomic,retain)UILabel *label;
@property (nonatomic,retain)UIButton *button;

-(void)setLabelText:(NSString *)text;
-(void)setButtonImage:(UIImage *)image;
@end
