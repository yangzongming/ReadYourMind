//
//  WebPageViewController.h
//  Collins_Jap
//
//  Created by aiside 02 on 10-6-29.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebPageViewController : UIViewController {
	IBOutlet UIWebView *webView;
	int i;
	
}

-(void) setDocName:(NSString *)name withTitle:(NSString *)title;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, assign) int i;

@end
