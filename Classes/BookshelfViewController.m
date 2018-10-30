//
//  BookshelfViewController.m
//  CollinsCE
//
//  Created by aiside 02 on 10-7-1.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BookshelfViewController.h"


@implementation BookshelfViewController

@synthesize webView;
@synthesize nav;
@synthesize myActivity;

/*
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	if ( (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) ) {
		about = nil;
	}
	
	return self;
}*/

- (void)viewDidAppear:(BOOL)animated {
	//NSURL *url = [[NSURL alloc]initWithString:@"http://58.64.130.107/talkingdict/iPhone_Bookshelf_COL.html"];
//	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//	[url release];
//	[webView loadRequest:request];
	//[request release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//[self.navigationController.navigationBar setHidden:YES];
//	UIColor *titleBarColor=[UIColor colorWithRed:70.0/255.0 green:102.0/255.0 blue:174.0/255.0 alpha:1.0];
//	self.nav.tintColor=titleBarColor;
	
	//[self addAbout];
	[self performSelectorInBackground:@selector(addAbout) withObject:nil];
    [super viewDidLoad];
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[cache release];
	[myActivity release];
	[webView release];
	[nav release];
    [super dealloc];
}

- (void) addAbout {
	
	if (about == nil) {
		
		//加缓冲
//		cache = [[CacheViewController alloc] initWithNibName:@"CacheViewController" bundle:nil];
//		[self.view addSubview: cache.view];
//		[self.view setNeedsDisplay]; 
		
		//NSLog(@"= =1");
		about = [[AboutProductsViewController alloc] initWithNibName:@"AboutProductsViewController" 
															bundle: nil];
		[about setDelegate:self];
	}
	
	[self.view addSubview: about.view];

	//[self.view sendSubviewToBack: about.view];
	
}

#pragma mark -
- (void)webViewDidStartLoad:(UIWebView *)webView{
	[self.myActivity startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
	[self.myActivity stopAnimating];
}

- (IBAction) back {
	//[self.view removeFromSuperview];
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark delegate
-(void)BtnClick{
	[self dismissModalViewControllerAnimated:YES];
}
@end
