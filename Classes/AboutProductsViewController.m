//
//  AboutProductsViewController.m
//  CollinsCE
//
//  Created by Alan on 16/07/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AboutProductsViewController.h"
#import "HTTPUtil.h"
#import "DDXML.h"
#import "Constant.h"
#import "AppsInfoObject.h"
#import "AppsInfoView.h"

@implementation AboutProductsViewController
//@synthesize iPadAppsArray;
@synthesize iPhoneAppsArray;
@synthesize spinner;
@synthesize mainScrollView;
//@synthesize shelfiPad;
@synthesize shelfiPhone;
//@synthesize iPadAppsViewArray;
@synthesize shelfLayerArray;
@synthesize iPhoneAppsViewArray;
@synthesize btnMoreDWE;
@synthesize shelfSepaterArray;
@synthesize back;
@synthesize delegate;
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.navigationController.navigationBar.hidden=YES;
		self.mainScrollView = [[UIScrollView alloc] init];
		[self.view addSubview: mainScrollView];
		
		if (iPhoneAppsArray==nil)
			[self performSelectorOnMainThread:@selector(loadData)  withObject:nil waitUntilDone:YES];
		
		else {
			[self arrangeUI];
		}
		[self analysis:[NSString stringWithFormat:@"/%@_Bookshelf_Page",kBundleID]];
		
//		self.back = [[UIButton alloc] init];
//		[self.view addSubview: back];
//		[self.view bringSubviewToFront: back];
    }
    return self;
}



-(void) loadData
{
	/*if (iPadAppsArray!=nil)
	{
		[iPadAppsArray release];
		iPadAppsArray=nil;
	}*/
	if (iPhoneAppsArray!=nil)
	{
		[iPhoneAppsArray release];
		iPhoneAppsArray=nil;
		
	}
	
	//iPadAppsArray=[[NSMutableArray alloc] init];
	iPhoneAppsArray=[[NSMutableArray alloc] init];
	NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
	
	NSString *dataString=[HTTPUtil getData:kCatalog withCache:@"apps.xml" timCache:60*60];
	NSXMLDocument *xmlDoc = [[[NSXMLDocument alloc] initWithXMLString:dataString options:0 error:nil] autorelease];
	//NSLog(@"dataString=%@",dataString);
	if(xmlDoc)
	{
		
		
		NSXMLElement *rootElement= [xmlDoc rootElement];
		
		NSArray *list=[rootElement elementsForName:@"app"];
		NSLog(@"XML OK with App %d",[list count]);
		for (int i=0;i<[list count];i++)
		{
			NSXMLElement *data=(NSXMLElement *)[list objectAtIndex:i];
			
			AppsInfoObject *app=[[AppsInfoObject alloc] init];
			app.appid=[[[data elementForName:@"appid"] stringValue] copy];
			app.appname=[[[data elementForName:@"appname"] stringValue] copy];
			app.iconPath=[[[data elementForName:@"icon"] stringValue] copy];
			app.prices=[[[data elementForName:@"prices"] stringValue] copy];
			app.appstore=[[[data elementForName:@"appstore"] stringValue] copy];
			app.discount=[[[data elementForName:@"discount"] stringValue] copy];
			
			if (![[[data attributeForName:@"type"] stringValue] isEqualToString:@"ipad"])
			{
				[iPhoneAppsArray addObject:app];
			}
			[app release];
		}
		
		
	}
	else
	{
		NSLog(@"XML fail");
	}
	
	[self updateUI];
	
	//NSLog(@" Total Apps : %d %d", [iPadAppsArray count], [iPhoneAppsArray count]);
	
	[pool release];
	
}

-(void) arrangeUI
{
	
	
	for (int i=0;i<[shelfSepaterArray count];i++)//
	{
		UIImageView *shelfImage= (UIImageView *)[shelfSepaterArray objectAtIndex:i];
		[mainScrollView addSubview:shelfImage];
	}
	//NSLog(@"iPadAppsViewArray= %d",[iPadAppsViewArray count]);
	/*for (int i=0;i<[iPadAppsViewArray count];i++)
	{
		AppsInfoView *appView=(AppsInfoView *) [iPadAppsViewArray objectAtIndex:i];
		[mainScrollView addSubview:appView];
		[mainScrollView bringSubviewToFront:appView];
	}*/
	NSLog(@"iPhoneAppsViewArray= %d",[iPhoneAppsViewArray count]);
	for (int i=0;i<[iPhoneAppsViewArray count];i++) //
	{
		AppsInfoView *appView=(AppsInfoView *) [iPhoneAppsViewArray objectAtIndex:i];
		[mainScrollView addSubview:appView];
		[mainScrollView bringSubviewToFront:appView];
	}
	//[mainScrollView addSubview:shelfiPad];
	[self.view addSubview:shelfiPhone];
	
	AppsInfoView *appView=(AppsInfoView *) [iPhoneAppsViewArray lastObject];
	
	
	//
	
	UIImageView *bottomView=[[UIImageView alloc] initWithFrame:CGRectMake(0, appView.frame.origin.y+80, 320, 160)];
	bottomView.image=[UIImage imageNamed:@"Shelf_bottom_iphone.png"];
	[mainScrollView addSubview:bottomView];
	
	btnMoreDWE=[[UIButton alloc] initWithFrame:CGRectMake(34.5, appView.frame.origin.y+100, 251, 44)];
	[btnMoreDWE setImage:[UIImage imageNamed:@"Shelf_bottom_iphone_logo.png"] forState:UIControlStateNormal];
	[btnMoreDWE addTarget:self action:@selector(openDWEWebSite) forControlEvents:UIControlEventTouchUpInside];
	[mainScrollView addSubview:btnMoreDWE];
	//mainScrollView
	
	/*for (int i=0;i<[iPadAppsViewArray count];i++)
	{
		AppsInfoView *appView=(AppsInfoView *) [iPadAppsViewArray objectAtIndex:i];
		[mainScrollView bringSubviewToFront:appView];
	}*/
	
	for (int i=0;i<[iPhoneAppsViewArray count];i++) //
	{
		AppsInfoView *appView=(AppsInfoView *) [iPhoneAppsViewArray objectAtIndex:i];
		[mainScrollView bringSubviewToFront:appView];
	}
	
	[mainScrollView setContentSize:CGSizeMake(320, appView.frame.origin.y+160)]; //
	
	
}

-(void) updateUI
{
	/*if (shelfiPad==nil)
		shelfiPad=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Shelf_large_iPadapp.png"]];
	shelfiPad.frame=CGRectMake(0, 0, 320, 57);*/
	
	
	if (shelfSepaterArray==nil)
	{
		shelfSepaterArray=[[NSMutableArray alloc] init];
	}
	/*if (iPadAppsViewArray!=nil)
	{
		[iPadAppsViewArray release];
		iPadAppsViewArray=nil;
	}
	iPadAppsViewArray=[[NSMutableArray alloc] init];
	int rowCount=0;
	for (int i=0;i<[iPadAppsArray count];i++)
	{
		if (( i % 2 )==0)
		{
			//create the shelf
			UIImageView *shelfImage=[[UIImageView alloc] initWithFrame:CGRectMake(192*(i %2), 100 * (int) (i / 2)+shelfiPad.frame.origin.y+shelfiPad.frame.size.height+60, 320, 44)];
			
			shelfImage.image=[UIImage imageNamed:@"Shelf_small.png"];
			rowCount++;
			//[mainScrollView addSubview:shelfImage];
			[shelfSepaterArray addObject:shelfImage];
			[shelfImage release];
			
		}
		
		AppsInfoObject *app=(AppsInfoObject *)[iPadAppsArray objectAtIndex:i];
		
		AppsInfoView *appView=[[AppsInfoView alloc] initWithFrame:CGRectMake(192*(i %2)+20, 100 * (int) (i / 2)+shelfiPad.frame.origin.y+shelfiPad.frame.size.height, 192, 100)];
		
		appView.iconView.image=[UIImage imageNamed:@"bookshelf_icon_ipad_plain.png"];
		if ([app.discount isEqualToString:@"T"])
		{
			appView.discountView.image=[UIImage imageNamed:@"Icon_sale.png"];
			
		}
		
		//check for the text size
		CGSize stringSize=[app.appname sizeWithFont:appView.appTitleLabel.font constrainedToSize:CGSizeMake(100, 9999) lineBreakMode:UILineBreakModeTailTruncation];
		
		appView.appTitleLabel.text=app.appname;
		if (stringSize.height<45)
			appView.appTitleLabel.frame=CGRectMake(75, 0, 100, stringSize.height);
		else
			appView.appTitleLabel.frame=CGRectMake(75, 0, 100, 45);
		
		appView.appStoreLink=app.appstore;
		[appView.btnPrice setTitle:app.prices forState:UIControlStateNormal];
		
		//appView.backgroundColor=[UIColor redColor];
		//[mainScrollView addSubview:appView];
		[iPadAppsViewArray addObject:appView];
		[appView release];
		
	}
	for (int i=rowCount;i<3;i++)
	{
		//create the shelf
		UIImageView *shelfImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 100 * rowCount+shelfiPad.frame.origin.y+shelfiPad.frame.size.height+60, 320, 44)];
		
		shelfImage.image=[UIImage imageNamed:@"Shelf_small.png"];
		rowCount++;
		[shelfSepaterArray addObject:shelfImage];
		[shelfImage release];
		
	}*/
	shelfiPhone=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Shelf_iphone_top.png"]];
	shelfiPhone.frame=CGRectMake(40, 0, 280, 57);
	
	
	//////////////////
	//back
	//back = [[UIButton alloc] initWithFrame:cgr]
	UIButton *backButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 00, 40, 57)] autorelease];
	[backButton setBackgroundImage:[UIImage imageNamed:@"asd00y.png"] forState: UIControlStateNormal];
	[backButton setBackgroundImage:[UIImage imageNamed:@"asd00y2.png"] forState: UIControlStateSelected];
	[backButton addTarget:self action:@selector(backTo) forControlEvents: UIControlEventTouchUpInside];
	[self.view addSubview: backButton];
	
	
	//////////////////
	
	
	
	
	//[mainScrollView addSubview:shelfiPhone];
	//main the iphone appview
	iPhoneAppsViewArray=[[NSMutableArray alloc] init];
	int rowCount2=0;
	for (int i=0;i<[iPhoneAppsArray count];i++)
	{
		if (( i % 2 )==0)
		{
			//create the shelf
			UIImageView *shelfImage=[[UIImageView alloc] initWithFrame:CGRectMake(142*(i %2), 100 * (int) (i / 2)+shelfiPhone.frame.origin.y+shelfiPhone.frame.size.height+40, 320, 44)];//
			
			shelfImage.image=[UIImage imageNamed:@"Shelf_iphone.png"];
			rowCount2++;
			[shelfSepaterArray addObject:shelfImage];
			[shelfImage release];
			
			
		}
		
		AppsInfoObject *app=(AppsInfoObject *)[iPhoneAppsArray objectAtIndex:i];
		
		AppsInfoView *appView=[[AppsInfoView alloc] initWithFrame:CGRectMake(142*(i %2)+20, 100 * (int) (i / 2)+shelfiPhone.frame.origin.y+shelfiPhone.frame.size.height-20, 142, 100)]; //
		[appView.btnPrice setTitle:app.prices forState:UIControlStateNormal];
		appView.iconView.image=[UIImage imageNamed:@"bookshelf_icon_ipad_plain.png"];
		if ([app.discount isEqualToString:@"T"])
		{
			appView.discountView.image=[UIImage imageNamed:@"Icon_sale.png"];
			
		}
		
		//check for the text size
		CGSize stringSize=[app.appname sizeWithFont:appView.appTitleLabel.font constrainedToSize:CGSizeMake(100, 9999) lineBreakMode:UILineBreakModeTailTruncation];
		
		
		appView.appTitleLabel.text=app.appname;
		if (stringSize.height<45)
			appView.appTitleLabel.frame=CGRectMake(62, 11, 78, stringSize.height);
		else
			appView.appTitleLabel.frame=CGRectMake(62, 11, 78, 45);
		
		appView.appStoreLink=app.appstore;
		//appView.backgroundColor=[UIColor redColor];
		//[mainScrollView addSubview:appView];
		[iPhoneAppsViewArray addObject:appView];
		[appView release];
		
	}
	
	
	
	[self arrangeUI];
	[self performSelectorOnMainThread:@selector(imageLoader)  withObject:nil waitUntilDone:YES];
}

-(void) openDWEWebSite
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.aisidechina.com"]];
}
-(void) viewWillAppear:(BOOL)animated
{
	self.navigationController.navigationBar.hidden=YES;
	if (iPhoneAppsArray==nil)
		[self performSelectorOnMainThread:@selector(loadData)  withObject:nil waitUntilDone:YES];
	
	else {
		[self arrangeUI];
	}
	[self analysis:[NSString stringWithFormat:@"/%@_Bookshelf_Page",kBundleID]];
	
}

-(void) imageLoader
{
	
	/*for (int i=0;i<[iPadAppsArray count];i++)
	{
		AppsInfoObject *app=(AppsInfoObject *)[iPadAppsArray objectAtIndex:i];
		AppsInfoView *appView=(AppsInfoView *) [iPadAppsViewArray objectAtIndex:i];
		NSString *imagePath=[HTTPUtil saveImage:app.iconPath withCache:[NSString stringWithFormat:@"apps_%@",app.appid]];
		appView.iconView.image=[UIImage imageWithContentsOfFile:imagePath];
		//NSLog(@"imagePath=%@",imagePath);
	}*/
	
	for (int i=0;i<[iPhoneAppsArray count];i++)
	{
		AppsInfoObject *app=(AppsInfoObject *)[iPhoneAppsArray objectAtIndex:i];
		AppsInfoView *appView=(AppsInfoView *) [iPhoneAppsViewArray objectAtIndex:i];
		NSString *imagePath=[HTTPUtil saveImage:app.iconPath withCache:[NSString stringWithFormat:@"apps_%@",app.appid]];
		appView.iconView.image=[UIImage imageWithContentsOfFile:imagePath];
		//NSLog(@"imagePath=%@",imagePath);
	}
	
	//	book.localCoverPath=
	
	//NSLog(@"imageLoader");
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[shelfSepaterArray release];
	[btnMoreDWE release];
	[iPhoneAppsViewArray release];
	[shelfLayerArray release];
	//[iPadAppsViewArray release];
	//[shelfiPad release];
	[shelfiPhone release];
	[mainScrollView release];
	[spinner release];
	//[iPadAppsArray release];
	[iPhoneAppsArray release];
    [super dealloc];
}

#pragma mark google

-(void)analysis:(NSString *)folder{
/*	NSError *error;
	if (![[GANTracker sharedTracker] trackPageview:[NSString stringWithFormat:@"%@",folder] withError:&error]) {
		// Handle error here
		//NSLog(@"trackPageview Error");
	}
	else {
		//NSLog(@"trackPageview Success");
		
	}
 */
}

- (IBAction) backTo {
	
	//NSLog(@"= =");
	//[self.view.superview removeFromSuperview];
	//[self.view removeFromSuperview];
	[delegate BtnClick];
	//[self dismissModalViewControllerAnimated:YES];
}

@end
