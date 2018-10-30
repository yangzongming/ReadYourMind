//
//  AppsObject.m
//  iPadReader
//
//  Created by Tim Chan on 02/07/2010.
//  Copyright 2010 Tim Chan. All rights reserved.
//

#import "AppsInfoObject.h"


@implementation AppsInfoObject
@synthesize appid;
@synthesize appname;
@synthesize iconPath;
@synthesize prices;
@synthesize discount;
@synthesize appstore;

-(void) dealloc
{
	[appid release];
	[appname release];
	[iconPath release];
	[prices release];
	[discount release];
	[appstore release];
	[super dealloc];
}

@end
