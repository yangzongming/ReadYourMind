//
//  WebPageViewController.m
//  Collins_Jap
//
//  Created by aiside 02 on 10-6-29.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebPageViewController.h"


@implementation WebPageViewController

@synthesize webView;
@synthesize i;

-(void) setDocName:(NSString *)name withTitle:(NSString *)title
{
	self.title = title;	
	NSString *filePath=[[NSBundle mainBundle] pathForResource:name ofType:@"html"];
	NSData	*htmlData=[NSData dataWithContentsOfFile:filePath];
	if (htmlData){
		webView.opaque = NO;
		webView.backgroundColor = [UIColor clearColor];
		[webView loadData:htmlData	MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:nil];
	}
	
}

- (void)goBack {
	[self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
	if(i==1) {
		[self setDocName:@"dwedu" withTitle:@"科教数码"];
	}
	if(i==2) {
		[self setDocName:@"collins" withTitle:@"柯林斯"];
	}
	if (i==3) {
		[self setDocName:@"EJ_Intro" withTitle:@"介绍"];
	}
	if (i==4) {
		[self setDocName:@"terms" withTitle:@"使用条款"];
	}
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
		cancelButton.frame = CGRectMake(0.0, 0.0, 56.0, 30.0);
		[cancelButton setImage:[UIImage imageNamed:@"Btn_Extra_Off.png"] forState:UIControlStateNormal];
		//		[cancelButton setImage:[UIImage imageNamed:@"Btn_Extra_On.png"] forState:UIControlStateSelected];
		
		[cancelButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
		UIBarButtonItem *temporaryBarButtonItem1 = [[UIBarButtonItem alloc] initWithCustomView:cancelButton];
		temporaryBarButtonItem1.style = UIBarButtonItemStylePlain;
		self.navigationItem.leftBarButtonItem=temporaryBarButtonItem1;
		[temporaryBarButtonItem1 release];
    }
    return self;
}




- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
	[webView release];
    [super dealloc];
}


@end
