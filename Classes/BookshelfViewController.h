//
//  BookshelfViewController.h
//  CollinsCE
//
//  Created by aiside 02 on 10-7-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutProductsViewController.h"
#import "CacheViewController.h"

@interface BookshelfViewController : UIViewController <UIWebViewDelegate,aboutDelegate>{
	
	IBOutlet UIWebView *webView;
	IBOutlet UINavigationBar *nav;
	IBOutlet UIActivityIndicatorView *myActivity;
	
	AboutProductsViewController *about;
	CacheViewController *cache;
}

- (IBAction) back;

- (void) addAbout;

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UINavigationBar *nav;
@property (nonatomic,retain)UIActivityIndicatorView *myActivity;

@end
