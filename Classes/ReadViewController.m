//
//  ReadViewController.m
//  Read
//
//  Created by apple007 on 09-12-10.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ReadViewController.h"

@implementation ReadViewController
@synthesize mainMenu,mainGame;
@synthesize mainSysmbols,mainBall;
@synthesize fireImage;
@synthesize cardImage;
@synthesize keyCardArray,normalCardArray;
@synthesize imageArray;
@synthesize imageIndex;
@synthesize ballButton,ball,bally;
@synthesize tryAgainButton;
@synthesize bigImageArray,ballStar;
@synthesize tryAgainImage,clickButtonImage;
@synthesize player;
@synthesize player2;
@synthesize gameBackButton;
@synthesize about;
@synthesize gameNext,gameback,SysmbolNext,SysmbolBack;

//

@synthesize scrollView; 
@synthesize numberView;
@synthesize confirmLayer;
@synthesize symbolView;
@synthesize englishButton,japanButton,chinaButton;
@synthesize languageIndex;
@synthesize soundFlag;
//setting
@synthesize soundButton;
@synthesize settingLanguageLayer;
@synthesize languageImage;

@synthesize numberBackButton,numberNextButton,symBackButton,symNextButton;
@synthesize readImageView;


@synthesize symBolNextButton;
@synthesize symBolBackButton;

@synthesize numberImage;
@synthesize symbolImage;

@synthesize nameButton;

@synthesize aboutBackButton; 
#pragma mark 自定义
-(void)showBallStar
{
	float x = 75+random()/(RAND_MAX/80);
	float y = 110 + random()/(RAND_MAX/80);
	[ballStar setFrame:CGRectMake(x, y, 40, 40)];
   	[UIView beginAnimations:@"e" context:nil];
	[UIView setAnimationDuration:0.8];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[ballStar setAlpha:1];
	[UIView commitAnimations];	
	[self performSelector:@selector(clearBallStar) 
			   withObject:nil 
			   afterDelay:0.8];
}
-(void)clearBallStar
{
	[UIView beginAnimations:@"e1" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[ballStar setAlpha:0];
	[UIView commitAnimations];	
}
-(IBAction)loadGame
{
	//NSLog(@"pass also");
	[self playButton3Sound];
	[self.view addSubview:mainGame];
	[mainMenu removeFromSuperview];
	
	if(soundFlag == YES)
	{
		//[player stop];
	}
}
-(IBAction)gameBack
{
	[self playButton3Sound];
	[self.view addSubview:mainMenu];
}
-(void)loadImageArray
{
	if(self.imageArray == nil)
	{
		self.imageArray = [[NSMutableArray alloc] init];	
	}
	if(self.bigImageArray == nil)
		self.bigImageArray = [[NSMutableArray alloc] init];
	for(int i=1;i<13;i++)
	{
		UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"p%d.png",i]];
		[imageArray addObject:image];
		UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"p%d.png",i]];
		[bigImageArray addObject:image2];
	}
}
-(void)loadFire
{
	UIImage *fire1 = [UIImage imageNamed:@"fire1.png"];
	UIImage *fire2 = [UIImage imageNamed:@"fire2.png"];
	UIImage *fire3 = [UIImage imageNamed:@"fire3.png"];
	UIImage *fire4 = [UIImage imageNamed:@"fire4.png"];
	//UIImage *fire5 = [UIImage imageNamed:@"fire5.png"];
	//UIImage *fire6 = [UIImage imageNamed:@"fire6.png"];
	NSArray *array = [[NSArray alloc] initWithObjects:fire1,fire2,fire3,fire4,fire4,fire3,fire2,nil];
	[self.fireImage setAnimationImages:array];
	[fireImage setAnimationDuration:0.9];
	[array release];
	[fireImage startAnimating];
	
	UIImage *card1 = [UIImage imageNamed:@"cardAries.png"];
	UIImage *card2 = [UIImage imageNamed:@"cardGemini.png"];
	UIImage *card3 = [UIImage imageNamed:@"cardPisces.png"];
	UIImage *card4 = [UIImage imageNamed:@"cardLeo.png"];
	UIImage *card5 = [UIImage imageNamed:@"cardVirgo.png"];
	UIImage *card6 = [UIImage imageNamed:@"cardTaurus.png"];
	UIImage *card7 = [UIImage imageNamed:@"cardAquarius.png"];
	
	NSArray *array2 = [[NSArray alloc] initWithObjects:card1,card2,card3,card4,card5,card6,card7,nil];
	[self.cardImage setAnimationImages:array2];
	[array2 release];
	[cardImage setAnimationDuration:10];
	[cardImage startAnimating];
}
-(IBAction)backToMenu
{
	[self playButton3Sound];
	[self.view addSubview:mainMenu];
	[mainGame removeFromSuperview];
	
	if(soundFlag == YES)
	{
		//[player play];
	}
}
-(IBAction)backToGame
{
	[self playButton3Sound];
	[self.view addSubview:mainGame];
	[mainSysmbols removeFromSuperview];
	[self changeCardImage];
	[self.ball setUserInteractionEnabled:YES];
	[self.tryAgainImage setAlpha:0];
	[self.bally setAlpha:0];
	[self.clickButtonImage setAlpha:1];
	
}
-(IBAction)backToSymbol
{
	
	[self playButton3Sound];
	[self.view addSubview:mainSysmbols];
	[mainBall removeFromSuperview];
	[self changeCardImage];
	
	//
	
	//
	[self.ball setUserInteractionEnabled:YES];
	[self.tryAgainImage setAlpha:0];
	[tryAgainButton setAlpha:0];
	[self.bally setAlpha:0];
	[self.clickButtonImage setAlpha:1];
	
	[scrollView setContentOffset:CGPointMake(0, 0)];
}

#pragma mark loadSymbol

-(IBAction)loadSymbol             //符号
{
	[self playButton3Sound];
	[self numberViewLoadConfirmLayer];
	return;
}
-(void)initHeartCard
{
	if(self.keyCardArray == nil)
		self.keyCardArray = [[NSMutableArray alloc] init];
	if(self.normalCardArray == nil)
		self.normalCardArray = [[NSMutableArray alloc] init];
	CGRect frame;
	for(int i=0;i<99;i++)
	{    
		HeartCard *card = [[HeartCard alloc] initWithFrame:CGRectZero];      	            
		
		
		frame = CGRectMake(480*(i/12)+((i%12)%4)*80+80,((i%12)/4)*80+40,100,90);

		[card setLabelText:[NSString stringWithFormat:@"%d",i+1]];
		[card setFrame:frame];
		[card setBackgroundColor:[UIColor clearColor]];
		[self.scrollView addSubview:card];
		if(i==8||i==17||i==26||i==35||i==44||i==53||i==62||i==71||i==80)
			[keyCardArray addObject:card];
		else
			[normalCardArray addObject:card];
		[card release];
	}
	[self changeCardImage];
}
-(IBAction)loadBall
{
	[self playButton3Sound];
	[self symBolViewLoadConfirmLayer];
}
-(void)loadFreeView
{
  
}
-(void)animateFree
{
	
}
-(void)changeCardImage
{
	for(int i=0;i<[normalCardArray count];i++)
	{
		[[normalCardArray objectAtIndex:i] setButtonImage:[imageArray objectAtIndex:(random()/(RAND_MAX/[imageArray count]))]];
	}
	int a = random()/(RAND_MAX/[imageArray count]);
	for(int i=0;i<[keyCardArray count];i++)
	{
		[[keyCardArray objectAtIndex:i] setButtonImage:[imageArray objectAtIndex:a]];
	}
	self.imageIndex = a;
}
-(IBAction)ballPressed
{
	[gameBackButton setUserInteractionEnabled:NO];
	
	[self playBallSound];
	
	[self performSelector:@selector(showBally) 
			   withObject:nil 
			   afterDelay:2];
	
	[self.ball setUserInteractionEnabled:NO];
	
	[gameBackButton setAlpha:0];
	
	if(ballStarFlag == YES)
	{
	[NSTimer scheduledTimerWithTimeInterval:5 
									 target:self
								   selector:@selector(showBallStar) 
								   userInfo:@"s" 
									repeats:YES];
		ballStarFlag = NO;
	}
}
-(void)showBally
{
	[self.bally setImage:[self.bigImageArray objectAtIndex:imageIndex]];
	[UIView beginAnimations:@"e" context:nil];
	[UIView setAnimationDuration:3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[bally setAlpha:1];
	[clickButtonImage setAlpha:0];
	[UIView commitAnimations];
	[self performSelector:@selector(showTryAgainView) 
			   withObject:nil
			   afterDelay:3];
}
-(void)showTryAgainView
{
	[UIView beginAnimations:@"e" context:nil];
	[UIView setAnimationDuration:1.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[self.tryAgainImage setAlpha:1];
	[tryAgainButton setAlpha:1];
	[UIView commitAnimations];
	[gameBackButton setUserInteractionEnabled:YES];
}
-(IBAction)tryAgain
{
	//[self playButton2Sound];
	[self playButton3Sound];
	[self.view addSubview:mainGame];
	[mainBall removeFromSuperview];
	[self changeCardImage];
	[self.ball setUserInteractionEnabled:YES];
	[self.tryAgainImage setAlpha:0];
	[self.bally setAlpha:0];
	[self.clickButtonImage setAlpha:1];
	[self.tryAgainButton setAlpha:0];
	[gameBackButton setAlpha:1];
}
#pragma mark 系统方法
-(void)loadPlayer
{	
	//backGround.mp3
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"S950" ofType:@"WAV"];
	NSURL *u = [NSURL fileURLWithPath:path];
	AVAudioPlayer *p = [[AVAudioPlayer alloc] initWithContentsOfURL:u error:nil];
	[p setDelegate:self];
	[p setNumberOfLoops:0];
	[p setVolume:1.0];
	self.player2 = p;
	[p release];
	
	
	NSString *path2 = [[NSBundle mainBundle] pathForResource:@"backGround" ofType:@"mp3"];
	NSURL *u2 = [NSURL fileURLWithPath:path2];
	AVAudioPlayer *p2 = [[AVAudioPlayer alloc] initWithContentsOfURL:u2 error:nil];
	[p2 setDelegate:self];
	[p2 setNumberOfLoops:0];
	[p2 setVolume:0.1];
	self.player = p2;
	[player setNumberOfLoops:-1];
	[p2 release];
	
	[player prepareToPlay];
}
#pragma mark 生硬

-(void)playButtonSound
{
	if(soundFlag == NO)
		return;
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Button" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &soundID1);
	AudioServicesPlaySystemSound(soundID1);
}
-(void)playButton2Sound
{
	if(soundFlag == NO)
		return;
	NSString *path = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &soundID2);
	AudioServicesPlaySystemSound(soundID2);	
}
-(void)playButton3Sound
{
	if(soundFlag == NO)
		return;
	NSString *path = [[NSBundle mainBundle] pathForResource:@"tfclickbb" ofType:@"wav"];
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &soundID3);
	AudioServicesPlaySystemSound(soundID3);
}
-(void)playBallSound
{
	if(soundFlag == NO)
		return;
	[player2 play];
}



- (void)viewDidLoad {
	
	soundFlag =  [[NSUserDefaults standardUserDefaults] boolForKey:@"soundFlag"];
	
	ballStarFlag = YES;
	
	for(int i=0;i<9;i++)
	{
		UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(i*480,0,480,320)];
		[image setImage:[UIImage imageNamed:@"RYM_Paper_large.png"]];
		[scrollView addSubview:image];
		[image release];
		
		// 加载 页码
		UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(i*480+187, 267, 110, 8)];
		[image2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]]];
		[scrollView addSubview:image2];
		[image2 release];
		
	}
	[scrollView setContentSize:CGSizeMake(480*9, 320)];
	[scrollView setShowsVerticalScrollIndicator:NO];
	[scrollView setPagingEnabled:YES];
	
	//languageIndex = 1;
	
	languageIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"languageIndex"];
	[self setLanguage:languageIndex];
	
	
	[self loadSetting];
	[self loadPlayer];
	[self.view addSubview:mainMenu];
	srandom((unsigned)time(NULL));
	[self loadImageArray];
	[ballStar setAlpha:0];
	[self loadFire];
	[self initHeartCard];
	//[self loadFreeView];
	self.navigationController.navigationBar.hidden = YES;
	
	[mainSysmbols setBackgroundColor:[UIColor clearColor]];
	
	if(soundFlag == YES)
	[player play];
	
	
	if(soundFlag == YES)
	{
		[soundButton setBackgroundImage:[UIImage imageNamed:@"s_1.png"] forState:UIControlStateNormal];
	}else {
		[soundButton setBackgroundImage:[UIImage imageNamed:@"s_2.png"] forState:UIControlStateNormal];
	}
	
	[numberView setBackgroundColor:[UIColor clearColor]];
	[symbolView setBackgroundColor:[UIColor clearColor]];
	
    [super viewDidLoad];
}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[symbolImage release];
	[numberImage release];
	
	[symBolBackButton release];
	[symBolNextButton release];
	[scrollView release];
	
	[numberView release];
	[confirmLayer release];
	[symbolView release];
	[settingLanguageLayer release];
	[readImageView release];
	
	[numberBackButton release];
	[numberNextButton release];
	[symNextButton release];
	[symBackButton release];
	
	[soundButton release];
	[chinaButton release];
	[japanButton release];
	[englishButton release];
	[languageImage release];
	
	[gameNext release];
	[gameback release];
	[SysmbolNext release];
	[SysmbolBack release];
	
	[clickButtonImage release];
	[tryAgainImage release];
	
	[ballStar release];
	[bigImageArray release];
	[tryAgainButton release];
	
	[bally release];
	[ball release];
	[ballButton release];
	[imageArray release];
	
	[keyCardArray release];
	[normalCardArray release];
	[fireImage release];
	
	[mainSysmbols release];
	[mainBall release];
	[mainMenu release];
	
	[mainGame release];
	[cardImage release];
	[player2 release];
	
	[player release];
	[about release];
	[gameBackButton release];
	
	[nameButton release];
	
	[aboutBackButton release];
    [super dealloc];
}



#pragma mark confirmLayer
-(void)numberViewLoadConfirmLayer{
	
	[mainGame addSubview:confirmLayer];
	[numberView setFrame:CGRectMake(80,-200,320,200)];
	[mainGame addSubview:numberView];
	
	[UIView beginAnimations:@"e" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[numberView setFrame:CGRectMake(80,60,320,200)];
	
	[UIView commitAnimations];
}
-(IBAction)numberViewYESClick{
	
	[confirmLayer removeFromSuperview];
	[numberView removeFromSuperview];

	
	[self.view addSubview:mainSysmbols];
	
	[self.mainGame removeFromSuperview];
	
	[scrollView setContentOffset:CGPointMake(0, 0)];
}
-(IBAction)numberViewNOClick{
	[confirmLayer removeFromSuperview];
	[numberView removeFromSuperview];
}

-(void)symBolViewLoadConfirmLayer{
	
	[mainSysmbols addSubview:confirmLayer];
	[symbolView setFrame:CGRectMake(80,-200,320,200)];
	[mainSysmbols addSubview:symbolView];
	
	[UIView beginAnimations:@"e" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[symbolView setFrame:CGRectMake(80,60,320,200)];
}
-(IBAction)symBolViewYESCLick{
	[confirmLayer removeFromSuperview];
	[symbolView removeFromSuperview];
	
	[self.view addSubview:mainBall];
	[mainSysmbols removeFromSuperview];
}
-(IBAction)sumBolViewNOClick{
	[confirmLayer removeFromSuperview];
	[symbolView removeFromSuperview];
}


#pragma mark setting
-(void)loadSetting{
	
	switch(languageIndex)
	{
		case 1:
			[englishButton setImage:[UIImage imageNamed:@"language_S_1.png"] forState:UIControlStateNormal];
			break;
		case 2:
			[chinaButton setImage:[UIImage imageNamed:@"language_S_2.png"] forState:UIControlStateNormal];
			break;
		case 3:
			[japanButton setImage:[UIImage imageNamed:@"language_S_3.png"] forState:UIControlStateNormal];
			break;
	}
	
}

-(IBAction)soundButtonClick{
	if(soundFlag == YES)
	{
		[soundButton setBackgroundImage:[UIImage imageNamed:@"s_2.png"] forState:UIControlStateNormal];
		[player stop];
		soundFlag = NO;
		[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"soundFlag"];
	}else
	{
		[soundButton setBackgroundImage:[UIImage imageNamed:@"s_1.png"] forState:UIControlStateNormal];
		
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"soundFlag"];
		soundFlag = YES;
		[player play];
	}
}
-(IBAction)languageButtonClick:(id)sender{
	UIButton *ln = (UIButton *)sender;
	if(ln.tag == languageIndex)
	{
		return;
	}else {
		
		switch(ln.tag)
		{
			case 1:
				[languageImage setImage:[UIImage imageNamed:@"settingLayer1.png"]];
				[self setLanguage:1];
				[self.mainMenu addSubview:settingLanguageLayer];
				languageIndex = 1;
				[englishButton setImage:[UIImage imageNamed:@"language_S_1.png"] forState:UIControlStateNormal];
				[chinaButton setImage:[UIImage imageNamed:@"language_2.png"] forState:UIControlStateNormal];
				[japanButton setImage:[UIImage imageNamed:@"language_3.png"] forState:UIControlStateNormal];
				[[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"languageIndex"];
				break;
			case 2:
				[languageImage setImage:[UIImage imageNamed:@"settingLayer2.png"]];
				[self setLanguage:2];
				[self.mainMenu addSubview:settingLanguageLayer];
				languageIndex = 2;
				[englishButton setImage:[UIImage imageNamed:@"language_1.png"] forState:UIControlStateNormal];
				[chinaButton setImage:[UIImage imageNamed:@"language_S_2.png"] forState:UIControlStateNormal];
				[japanButton setImage:[UIImage imageNamed:@"language_3.png"] forState:UIControlStateNormal];
				[[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"languageIndex"];
				break;
			case 3:
				[languageImage setImage:[UIImage imageNamed:@"settingLayer3.png"]];
				[self setLanguage:3];
				[self.mainMenu addSubview:settingLanguageLayer];
				languageIndex = 3;
				[englishButton setImage:[UIImage imageNamed:@"language_1.png"] forState:UIControlStateNormal];
				[chinaButton setImage:[UIImage imageNamed:@"language_2.png"] forState:UIControlStateNormal];
				[japanButton setImage:[UIImage imageNamed:@"language_S_3.png"] forState:UIControlStateNormal];
				[[NSUserDefaults standardUserDefaults] setInteger:3 forKey:@"languageIndex"];
				break;
		}
		
		[self performSelector:@selector(removeSettingLanguageLayer)
				   withObject:nil
				   afterDelay:2.5];
	}
}

-(void)setLanguage:(int)index{
	
	
	[gameNext setImage:[UIImage imageNamed:[NSString stringWithFormat:@"next%d.png",index]] forState:UIControlStateNormal];
	[gameback setImage:[UIImage imageNamed:[NSString stringWithFormat:@"back%d.png",index]] forState:UIControlStateNormal];
	
	
	
	[SysmbolNext setImage:[UIImage imageNamed:[NSString stringWithFormat:@"next%d.png",index]] forState:UIControlStateNormal];
	[SysmbolBack setImage:[UIImage imageNamed:[NSString stringWithFormat:@"back%d.png",index]] forState:UIControlStateNormal];
	
	[numberBackButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cancel%d.png",index]] forState:UIControlStateNormal];
	[numberNextButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ok%d.png",index]] forState:UIControlStateNormal];
	
	[symBackButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cancel%d.png",index]] forState:UIControlStateNormal];
	[symNextButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ok%d.png",index]] forState:UIControlStateNormal];
	
	
	
	[gameBackButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"back%d.png",index]] forState:UIControlStateNormal];
	
	[readImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"readText%d.png",index]]];
	
	[symBolBackButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"back%d.png",index]] forState:UIControlStateNormal];
	[symBolNextButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"next%d.png",index]] forState:UIControlStateNormal];
	
	[tryAgainButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"try again%d.png",index]] forState:UIControlStateNormal];
	[tryAgainImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"zimu%d.png",index]]];
	[clickButtonImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"zifu%d.png",index]]];
	//
	//
	//
	
	[numberImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"askNumber%d.png",index]]];
	[symbolImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"askSymbol%d.png",index]]];
	
	
	[nameButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"name%d.png",index]] forState:UIControlStateNormal];
	
	[aboutBackButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"back%d.png",index]] forState:UIControlStateNormal];
}

-(void)removeSettingLanguageLayer{
	[settingLanguageLayer removeFromSuperview];
}

//about 

-(IBAction)aboutBtnClick{
	
	[mainMenu addSubview:about];
	
}

-(IBAction)aboutBackClick{
	[self playButton3Sound];
	[about removeFromSuperview];
}

-(IBAction)moreClick{
	BookshelfViewController *o = [[BookshelfViewController alloc] initWithNibName:@"BookshelfViewController" bundle:nil];
	[self presentModalViewController:o animated:YES];
}

-(void)loadMore{
	
}

#pragma mark aiside

-(IBAction)AiSIDeLink{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.aisidealliance.com/index.do"]];
}
@end
