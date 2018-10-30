//
//  Game.h
//  Read
//
//  Created by apple007 on 09-12-10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sysmbols.h"
#import "Ball.h"
@interface Game : UIView {
	IBOutlet UIView *subView;	
	IBOutlet Sysmbols *mainSysmbols;
	IBOutlet Ball *mainBall;
}
@property (nonatomic,retain)IBOutlet Ball *mainBall;
@property (nonatomic,retain)IBOutlet UIView *subView;
@property (nonatomic,retain) IBOutlet Sysmbols *mainSysmbols;
@end
