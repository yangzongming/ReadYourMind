//
//  ReadYourHeartAppDelegate.h
//  ReadYourHeart
//
//  Created by aiside aiside on 10-10-21.
//  Copyright 2010 aiside. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReadViewController;

@interface ReadYourHeartAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ReadViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ReadViewController *viewController;

@end

