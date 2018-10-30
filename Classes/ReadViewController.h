//
//  ReadViewController.h
//  Read
//
//  Created by apple007 on 09-12-10.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Menu.h"
#import "Game.h"
#import "Sysmbols.h"
#import "HeartCard.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "BookshelfViewController.h"


@interface ReadViewController : UIViewController 
<AVAudioPlayerDelegate>
{
	SystemSoundID soundID2;
	SystemSoundID soundID1;
	SystemSoundID soundID3;
	AVAudioPlayer *player;
	AVAudioPlayer *player2;
	
	
	
	IBOutlet Menu *mainMenu;
	IBOutlet UIImageView *fireImage;
	IBOutlet UIImageView *cardImage;
	BOOL angleFlag;
	BOOL frameFlag;
	float angle;
	
	IBOutlet Game *mainGame;
	IBOutlet Sysmbols *mainSysmbols;
	IBOutlet Ball *mainBall;
	IBOutlet UIView *about;
	
	NSMutableArray *keyCardArray;
	NSMutableArray *normalCardArray;
	NSMutableArray *imageArray;
	NSMutableArray *bigImageArray;
	NSUInteger imageIndex;
	
	
	IBOutlet UIButton *ballButton;
	IBOutlet UIButton *ball;
	IBOutlet UIImageView *bally;
	
	IBOutlet UIButton *tryAgainButton;
	IBOutlet UIImageView *ballStar;
	IBOutlet UIImageView *tryAgainImage;
	IBOutlet UIImageView *clickButtonImage;
	IBOutlet UIButton *gameBackButton;
	
	IBOutlet UIButton *gameNext;
	IBOutlet UIButton *gameback;
	
	IBOutlet UIButton *SysmbolNext;
	IBOutlet UIButton *SysmbolBack;
	
	
	//FlowCover
	IBOutlet UIButton *symBolNextButton;
	IBOutlet UIButton *symBolBackButton;
	
	BOOL ballStarFlag;
	IBOutlet UIScrollView *scrollView;
	//confrim
	
	IBOutlet UIView *confirmLayer;
	IBOutlet UIView *numberView;
	IBOutlet UIView *symbolView;
	
	IBOutlet UIButton *numberBackButton;
	IBOutlet UIButton *numberNextButton;
	IBOutlet UIButton *symBackButton;
	IBOutlet UIButton *symNextButton;
	
	//setting
	
	IBOutlet UIImageView *readImageView;
	
	IBOutlet UIView *settingLanguageLayer;
	IBOutlet UIImageView *languageImage;
	
	IBOutlet UIButton *soundButton;
	IBOutlet UIButton *englishButton;
	IBOutlet UIButton *japanButton;
	IBOutlet UIButton *chinaButton;
	
	int languageIndex;
	BOOL soundFlag;
	
	//
	
	IBOutlet UIImageView *numberImage;
	IBOutlet UIImageView *symbolImage;
	IBOutlet UIButton *nameButton;	
	
	IBOutlet UIButton *aboutBackButton;
}
@property (nonatomic,retain)IBOutlet UIView *about;
@property (nonatomic,retain)AVAudioPlayer *player2;
@property (nonatomic,retain)AVAudioPlayer *player;
@property (nonatomic,retain)Menu *mainMenu;
@property (nonatomic,retain)IBOutlet UIImageView *fireImage;
@property (nonatomic,retain)IBOutlet UIImageView *cardImage;


@property (nonatomic,retain) IBOutlet UIButton *ballButton;
@property (nonatomic,retain) IBOutlet UIButton *ball;
@property (nonatomic,retain) IBOutlet UIImageView *bally;
@property (nonatomic,retain)IBOutlet UIButton *tryAgainButton;
@property (nonatomic,retain)IBOutlet UIImageView *ballStar;
@property (nonatomic,retain)IBOutlet UIImageView *tryAgainImage;
@property (nonatomic,retain)IBOutlet UIButton *gameBackButton;
@property (nonatomic,retain)IBOutlet UIImageView *clickButtonImage;

@property (nonatomic,retain) NSMutableArray *keyCardArray;
@property (nonatomic,retain) NSMutableArray *normalCardArray;
@property (nonatomic,retain)NSMutableArray *imageArray;
@property (nonatomic,retain)NSMutableArray *bigImageArray;
@property NSUInteger imageIndex;
@property (nonatomic,retain)Game *mainGame;
@property (nonatomic,retain) IBOutlet Sysmbols *mainSysmbols;
@property (nonatomic,retain) IBOutlet Ball *mainBall;
@property (nonatomic,retain)  UIButton *gameNext;
@property (nonatomic,retain)  UIButton *gameback;
@property (nonatomic,retain) IBOutlet UIButton *SysmbolNext;
@property (nonatomic,retain) IBOutlet UIButton *SysmbolBack;

//
@property (nonatomic,retain)IBOutlet UIScrollView *scrollView;

@property (nonatomic,retain)IBOutlet UIView *numberView;
@property (nonatomic,retain)IBOutlet UIView *confirmLayer;
@property (nonatomic,retain)IBOutlet UIView *symbolView;

@property (nonatomic,retain)IBOutlet UIButton *numberBackButton;
@property (nonatomic,retain)IBOutlet UIButton *numberNextButton;
@property (nonatomic,retain)IBOutlet UIButton *symBackButton;
@property (nonatomic,retain)IBOutlet UIButton *symNextButton;

//setting
@property (nonatomic,retain)IBOutlet UIView *settingLanguageLayer;
@property (nonatomic,retain)IBOutlet UIImageView *languageImage;

@property (nonatomic,retain)IBOutlet UIButton *soundButton;
@property (nonatomic,retain)IBOutlet UIButton *englishButton;
@property (nonatomic,retain)IBOutlet UIButton *japanButton;
@property (nonatomic,retain)IBOutlet UIButton *chinaButton;

@property (nonatomic,assign)int languageIndex;
@property (nonatomic,assign)BOOL soundFlag;

@property (nonatomic,retain)IBOutlet UIImageView *readImageView;

@property (nonatomic,retain)IBOutlet UIButton *symBolNextButton;
@property (nonatomic,retain)IBOutlet UIButton *symBolBackButton;


@property (nonatomic,retain)IBOutlet UIImageView *numberImage;
@property (nonatomic,retain)IBOutlet UIImageView *symbolImage;
@property (nonatomic,retain)IBOutlet UIButton *nameButton;	

@property (nonatomic,retain)IBOutlet UIButton *aboutBackButton;

-(IBAction)loadGame;                    //进入游戏
-(void)loadImageArray;
-(void)loadFire;
-(IBAction)gameBack;



-(IBAction)backToMenu;
-(IBAction)backToGame;
-(IBAction)backToSymbol;

-(IBAction)loadSymbol;
-(void)initHeartCard;
-(IBAction)loadBall;
-(void)loadFreeView;
-(void)animateFree;
-(void)changeCardImage;
-(IBAction)ballPressed;
-(void)showBally;
-(IBAction)tryAgain;
-(void)showBallStar;
-(void)clearBallStar;
-(void)showTryAgainView;
-(void)loadPlayer;

-(void)playButtonSound;
-(void)playBallSound;
-(void)playButton2Sound;
-(void)playButton3Sound;

#pragma mark 图片截取

-(void)numberViewLoadConfirmLayer;

-(IBAction)numberViewYESClick;
-(IBAction)numberViewNOClick;

-(void)symBolViewLoadConfirmLayer;
-(IBAction)symBolViewYESCLick;
-(IBAction)sumBolViewNOClick;

//setting
-(void)loadSetting;
-(IBAction)soundButtonClick;
-(IBAction)languageButtonClick:(id)sender;

-(void)setLanguage:(int)index;

// about

-(IBAction)aboutBtnClick;
-(IBAction)aboutBackClick;

-(IBAction)moreClick;

-(IBAction)AiSIDeLink;
@end

