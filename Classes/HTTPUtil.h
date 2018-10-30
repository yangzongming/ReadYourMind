//
//  GetXMLData.h
//  HangSengPWS
//
//  Created by cktim852 on 04/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HTTPUtil : NSObject {
	
}
+(NSString *) getData:(NSString *)urlpath withCache:(NSString *)filename timCache:(NSInteger)timelap;
+(NSString *) saveImage:(NSString *)urlpath withCache:(NSString *)filename;

@end
