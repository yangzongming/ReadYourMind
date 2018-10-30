#define kFeedbackpLink @"http://58.64.130.107/talkingdict/feedback.jsp"
#define kBackupLink @"http://58.64.130.107/talkingdict3/upbm.jsp"
#define kRestoreLink @"http://58.64.130.107/talkingdict3/getList.jsp?uid="
#define kServerDomain @"http://58.64.130.107"

#define kTestPrepType @"COL_EJ"
#define kVoiceTestType @"COL_EJ_VOICE"
#define kVocabTestLink @"http://58.64.130.107/cald4/colVocTestEJ.jsp?hwtype=COL_EJ"
#define kVoiceTestLink @"http://58.64.130.107/cald4/colVocTestEJ.jsp?hwtype=COL_EJ_V"

#define kVocabTestRecordLink @"http://58.64.130.107/cald4/testFeedbackNew.jsp" // Test Module //20090831
#define kVocabTestRankLink @"http://58.64.130.107/cald4/testRankingFeedback.jsp" // Test Module

//about, kissxml
#define kServerHost @"58.64.130.107"
//#define kCatalog @"http://58.64.130.107/apps/dwe_apps.xml"
#define kCatalog @"http://www.aisidealliance.com//AiSIDeMarketServer/hungryRatGetXMLPage.jsp"

#define kBundleID @"COL.003.C.EJ.V.F"
#define kGANDispatchPeriodSec 10

#pragma mark DB Variables
#define kbookDBName @"bookmark.db"

#pragma mark DisplayCell

#define kCellLeftOffset			8.0
#define kCellTopOffset			12.0
#define kSwitchButtonWidth		94.0
#define kSwitchButtonHeight		27.0
#define kUIRowHeight			50.0
#define kUIRowLabelHeight		35.0
#define kPageControlWidth		160.0


#define kAppDelegateAlert	@"您确定要离开应用程序及打开科教数码的网页吗"//@"Are you sure you want to quit the application and open the DW Education website ?"
#define kYes				@"确定"//@"Yes"
#define kCancel				@"取消"//@"Cancel"

#define kSureDelAll			@"您确定要清除全部书签嗎?"
#define kEmailError			@"电邮错误"//:请填上您的电邮地址;OK"
#define kInputEmail			@"请填上您的电邮地址"
#define kOK					@"确定"//@"OK"
#define kCancelButton		@"确定"//@"OK"
#define kInputFeedback		@"请填上您的意见反馈"
#define kSendFailed			@"传送失败，请再尝试!"
#define kThanksFeedback		@"谢谢您的意见，我们会尽快回复您！"
#define kNewGroupName		@"新群组名称"
#define kBuild				@"储存"//@"Save"
#define kWarning			@"注意"
#define kGroupNameExist		@"组名已存在!"
#define	kCrossSearch		@"跳查"
#define kSelectAGroupFor	@"请选择要储存笔记的群组"
#define kSelectAGroup		@"请选择群组"
#define kNotes				@"笔记："
#define kBookmarkGroups		@"书签群组:"//@"Bookmark Groups:"
#define kInternetIsRequired	@"必需先联机到互联网，才能传送您的意见反馈。\r\n请稍后再尝试！"
#define kAboutLong			@"关于培生朗文香港"
#define kAboutDW			@"关于科教数码"
#define kTermsOfUse			@"使用条款"
#define kChangeGroupName	@"重新命名群组"

#define kSorry				@"对不起"
#define kNoWord				@"没有这个单词！"//No this word in database!
#define kAddSuccessfully	@"成功新增文件夹!"//@"Add folder successfully!" 
#define kRenameFolder		@"请重新输入文件夹名称!"//@"Please re-name your folder!"
#define kNameYourFolder		@"给您的分组命名:"//@"Name Your Folder："
#define kPleaseNameFolder	@"请输入活页夹名称!"//@"Please Name Your Folder!"

#define	kFillinBlanks		@"填空"	//TestMainViewController.m:72,183
#define kListening			@"听辨单词"	//VoiceTestMainViewController.m:189
#define kTextViewText		@"您可以利用从词典随机抽出的10条问题测试自己，并与世界各地的用户一较高下，\n\n 提醒：请确保您的设备连接到互联网。"//	QuizViewController.m:141

#define kSureDelGroup		@"您确定要删除此书签分组嗎?"//@"Are you sure you want to delete this group?"

//常量
#define kBack               @"返回"//@"Back"	
#define kVoiceTest          @"听辨单词"//@"Listening Test"	
#define kWorldRank			@"世界排名"//@"World Ranking"	
#define kRank				@"等级"//@"Level"	
#define kScore				@"成绩"//@"Score"	
#define kTime				@"时间"//@"Time"	时间
#define kTimeTaken			@"所用时间"//@"Time Taken"	所用时间
#define kMyScore			@"我的成绩"//@"My Scores"	我的成绩
#define kLoading			@"加载中"//@"Loading in progress"	加载中
#define kNoName				@"不记录"//@"Nevermind"	不记录
#define kInternetWarning	@"网络联机是必需的"//@"Internet connection is required."	需要与互联网联机
#define kInputName			@"前10名！请输入您的名字: "//@"Top 10! Enter your name:"	前10名!请输入您的姓名
#define kAlertNoWord		@"找不到"//@"Word not found."	没有此单词
#define kQuestion			@"%d / 10"	
#define kTimes				@"%ds"	
#define kSubmitPrompt		@"你想上载你的成绩到排行榜吗？"//@"Do you want to upload your score to our scoreboard?"	
#define kSubmitMsg			@"正提交您的成绩，请耐心等候。"//@"Please wait while your test result is being submitted."	
#define kInternetWarningSubmit @"必需有网络连接才可以提交您的成绩。"//@"Internet connection is required to submit your result."	必需先联机到互联网，才能提交您的成绩。
#define kLevel1				@"等级1"//@"Level 1 "	等级1
#define kLevel2				@"等级2"//@"Level 2 "	等级2
#define kLevel3				@"等级3"//@"Level 3 "	等级3
#define kInternetWarningTest  @"必需有网络连接才可以进行测验"//@"Internet connection is required to play the test."	
#define kAccumScore			@"累积分数: %d"//@"Accumulated Total Score: %d"	累积总得分:
#define kCongrat			@"恭喜！"//@"Congratulations!"	恭喜！
#define kUnlock2			@"测验2已解锁"//@"You have unlocked the level 2."	您已经解封等级2
#define kUnlock3			@"测验3已解锁"//@"You have unlocked the level 3."	您已经解封等级3
#define kName				@"姓名"//@"Name"	姓名
#define kTestInstruction	@"测试指引"//@"Test instructions:"	测试指引
#define kTestGraphic		@"测试界面"//@"Test Screen"	测试界面
#define kTestText			@"单词填空\n\n共有三个难度等级:\n等级1:缺少一个字母。\n等级2: 缺少两个字母。\n等级3: 只给出第一个字母。\n\n如果总成绩累积至100，等级2和3将会解封。"//@"Fill in the blank letter(s) of each vocabulary.\n\nThere are three difficulty levels:\nLEVEL 1 : One letter is missing.\nLEVEL 2 : Two letters are missing.\nLEVEL 3 : All letters are missing except the first letter of the vocabulary.\n\nLEVEL 2 & 3 tests will be unlocked if you have accumulated enough scores in the previous\nlevels."	
#define kPercent			@"您的成绩"//@"Your Score"	您的成绩
#define kTitle				@"标题"//@"Title"	标题
#define kAnswerAnalyst		@"答案分析"//@"Answer Analyst"	答案分析
#define kNote2				@"等级1累积总成绩超过100分，便可以解锁。"//@"Accumulate a total score of 100 in LEVEL 1 to unlock."	
#define kNote3				@"等级2得分累积至100，便可解封此等级。"//@"Accumulate a total score of 100 in LEVEL 2 to unlock."	等级2得分累积至100，便可解封此等级。
#define kCorrectAnswer		@"正确答案"//@"Correct Answers"	正确答案
#define kAlert9				@"必需先联机到互联网"//@"Internet connection is required."	必需先联机到互联网
#define kWordTest			@"词汇测试"//@"Vocabulary Test"	词汇测试


#define kManager			@"Data Management"
#define kComplete			@"P: 完成"
#define kCompleteBackup		@"P: 完成备份！"
#define kCompleteUndo		@"P: 完成恢复！"
#define kUndoMessage		@"Application restart is required."
#define kNoRecord			@"No record!"
#define kRecordUndoMessage	@"Application restart is required after the restoration!"
#define kBackupUndo			@"P: 备份/恢复正在进行中!"
#define kBookmarkBackup		@"Backup Notes & My List"
#define kBookmarkUndo		@"Restore Notes & My List"