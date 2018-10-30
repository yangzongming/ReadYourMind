//
//  AboutProductsViewController.h
//  CollinsCE
//
//  Created by Alan on 16/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

//#import "GANTracker.h"
@protocol aboutDelegate

-(void)BtnClick;

@end





@interface AboutProductsViewController : UIViewController {
	IBOutlet UIActivityIndicatorView *spinner;
	//NSMutableArray *iPadAppsArray;
	//NSMutableArray *iPadAppsViewArray;
	NSMutableArray *iPhoneAppsArray;
	NSMutableArray *iPhoneAppsViewArray;
	IBOutlet UIScrollView *mainScrollView;
	
	//UIImageView *shelfiPad;
	UIImageView *shelfiPhone;
	
	NSMutableArray *shelfSepaterArray;
	NSMutableArray *shelfLayerArray;
	UIButton *btnMoreDWE;
	
	IBOutlet UIButton *back;
	
	id<aboutDelegate> delegate;
}
-(void) arrangeUI;
-(void) updateUI;
-(void) loadData;
-(void) imageLoader;
-(void) openDWEWebSite;
- (IBAction) backTo;
@property (nonatomic, retain) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;
//@property (nonatomic, retain) NSMutableArray *iPadAppsArray;
@property (nonatomic, retain) NSMutableArray *iPhoneAppsArray;
//@property (nonatomic, retain) NSMutableArray *iPadAppsViewArray;
@property (nonatomic, retain) NSMutableArray *iPhoneAppsViewArray;
//@property (nonatomic, retain) UIImageView *shelfiPad;
@property (nonatomic, retain) UIImageView *shelfiPhone;
@property (nonatomic, retain) NSMutableArray *shelfSepaterArray;
@property (nonatomic, retain) NSMutableArray *shelfLayerArray;
@property (nonatomic, retain) UIButton *btnMoreDWE;
@property (nonatomic, retain) IBOutlet UIButton *back;


@property (nonatomic,retain)id<aboutDelegate> delegate;
-(void)analysis:(NSString *)folder;

@end
