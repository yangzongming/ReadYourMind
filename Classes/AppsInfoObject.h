//
//  AppsObject.h
//  iPadReader
//
//  Created by Tim Chan on 02/07/2010.
//  Copyright 2010 Tim Chan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppsInfoObject : NSObject {
	NSString *appid;
	NSString *appname;
	NSString *iconPath;
	NSString *prices;
	NSString *discount;
	NSString *appstore;
}
@property (nonatomic, retain) NSString *appid;
@property (nonatomic, retain) NSString *appname;
@property (nonatomic, retain) NSString *iconPath;
@property (nonatomic, retain) NSString *prices;
@property (nonatomic, retain) NSString *discount;
@property (nonatomic, retain) NSString *appstore;

@end
