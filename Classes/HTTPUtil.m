//
//  GetXMLData.m
//  HangSengPWS
//
//  Created by cktim852 on 04/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HTTPUtil.h"
#import "Reachability.h"
#import "Constant.h"
@implementation HTTPUtil
+(NSString *) saveImage:(NSString *)urlpath withCache:(NSString *)filename
{
	////NSLog(@"SAve Image for %@", urlpath);
	
	NSData *retureData=nil;
	NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *cache = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *cachePath = [cache objectAtIndex:0] ;	
	//filename=[filename stringByAppendingString:[cachePath substringFromIndex:<#(NSUInteger)from#>
	////NSLog(@"cachePath=%@",cachePath);
	filename=[filename stringByAppendingFormat:@"%@",[urlpath lastPathComponent]];
	NSString *filepath = [cachePath stringByAppendingString:@"/"];			
	filepath=[filepath stringByAppendingString:filename];
	
	////NSLog(@"filepath=%@",filepath);
	BOOL success;
	success = [fileManager fileExistsAtPath:filepath];
    if (success) 
	{
		return	 filepath;
		
	}
	else
	{
		
		////NSLog(@"Load Data %@",urlpath);
		NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];  
		[request setURL:[NSURL URLWithString:urlpath]];  
		[request setHTTPMethod:@"GET"];  
		
		NSURLResponse *response;
		NSError *error;
		
		retureData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
		//returnString=[[NSString alloc] initWithData:retureData encoding:NSUTF8StringEncoding];
		
		//bug 9-30
		//if ([fileManager createDirectoryAtPath:cachePath attributes:nil]==NO){
		if ( [fileManager createDirectoryAtPath: cachePath 
					withIntermediateDirectories: NO attributes:nil error:nil] == NO ){
						
			//////NSLog(@"fileManager createDirectoryAtPath:cachePath attributes:nil");
		}
		//////NSLog(@"file parh =%@",filepath);
		if ([retureData writeToFile:filepath atomically:YES]){
			////NSLog(@"save XML Success");
		}
		else
		{
			////NSLog(@"save XML Fail");
		}
	}
	
	if (retureData !=nil && [fileManager fileExistsAtPath:filepath]){
		
		return	 filepath;
	}
	[pool release];
	
	//NSLog(@" photo return nil");
	return nil;
	
	
	
}
+(NSString *) getData:(NSString *)urlpath withCache:(NSString *)filename timCache:(NSInteger)timelap
{
	NSData *retureData=nil;
	NSString *returnString=nil;
	NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *cache = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *cachePath = [cache objectAtIndex:0] ;	
	
	////NSLog(@"cachePath=%@",cachePath);
	NSString *filepath = [cachePath stringByAppendingString:@"/"];			
	filepath=[filepath stringByAppendingString:filename];
	////NSLog(@"filepath=%@",filepath);
	BOOL success;
	BOOL reload=TRUE;
	success = [fileManager fileExistsAtPath:filepath];
    if (success) 
	{
		//check the time whether reload or not
		
		//bug 9-30
		//NSDictionary *fileAttribute=[fileManager fileAttributesAtPath:filepath traverseLink:YES];
		NSDictionary *fileAttribute = [fileManager attributesOfItemAtPath:filepath error: nil];
		NSDate *fileModifyDate=nil;
		if (fileAttribute!=nil){
			
			if ( (fileModifyDate=[fileAttribute objectForKey:NSFileModificationDate]) ){
				//////NSLog(@"Modification date :%@", fileModifyDate);
			}
			
		}
		if (fileModifyDate!=nil){
			NSTimeInterval timeElapsed2 = [[NSDate date] timeIntervalSinceDate:fileModifyDate];
			float f=timeElapsed2;
			if (f<timelap)
				reload=FALSE;
		}
		
		
	}
	
	[[Reachability sharedReachability] setHostName:kServerHost];
	//check if available
	if ([[Reachability sharedReachability] internetConnectionStatus]==NotReachable)
	{
		reload=NO;
	}
	if (reload){
		
		////NSLog(@"Load Data %@",urlpath);
		NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];  
		[request setURL:[NSURL URLWithString:urlpath]];  
		[request setHTTPMethod:@"GET"];  
		//[request setValue:postLength forHTTPHeaderField:@"Content-Length"];  
		//[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];  
		//[request setHTTPBody:postData];  
		
		NSURLResponse *response;
		NSError *error;
		
		retureData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
		returnString=[[NSString alloc] initWithData:retureData encoding:NSUTF8StringEncoding];
		
		
		//bug 9-30
		////if ([fileManager createDirectoryAtPath:cachePath attributes:nil]==NO){
		if ([fileManager createDirectoryAtPath: cachePath withIntermediateDirectories: NO
								attributes: nil error: nil] == NO){
			
			//////NSLog(@"fileManager createDirectoryAtPath:cachePath attributes:nil");
		}
		//////NSLog(@"file parh =%@",filepath);
		if ([retureData writeToFile:filepath atomically:YES]){
			////NSLog(@"save XML Success");
		}
		else
		{
			////NSLog(@"save XML Fail");
		}
	}
	
	if (retureData ==nil && [fileManager fileExistsAtPath:filepath]){
		
		////NSLog(@"XXXX");
		retureData=[NSData dataWithContentsOfFile:filepath];
		////NSLog(@"retureData %d", [retureData length]);
		returnString=[[NSString alloc] initWithData:retureData encoding:NSUTF8StringEncoding];
		/////NSLog(@"returnString= %d, %d",[retureData  length],[returnString length]);
		//NSString *data=[NSString stringWithContentsOfURL:<#(NSURL *)url#>
	}
	[pool release];
	return returnString;
	
}
@end
