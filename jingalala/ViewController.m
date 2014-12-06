//
//  ViewController.m
//  WreckingBall
//
//  Created by Hadaytullah on 14/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "ViewController.h"
#import "LevelViewController.h"
#import "SharedResources.h"
//#import "MyScene.h"
#import "StartScene.h"
#import "GameState.h"
#import <Social/Social.h>

@interface ViewController(){
    //StartScene *scene;
    //u_int8_t currentLevel;
    //BOOL currentLevelEnded;
    //BOOL iAdsEnable;
    //GameState* gameState;
}

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [GameState getGameState].currentLevel=SelectLevelView;
    [GameState getGameState].currentLevelEnded=YES;
    
    //[NSString string]
//    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
//    //NSLog(@"%@",bundleIdentifier);
//    
//    if([bundleIdentifier isEqualToString:AdsFreeBundle]){
//        iAdsEnable=NO;
//    }else{
//        iAdsEnable=YES;
//    }
    [self initializeGame];
   // [self initializeGame];
    //gameState = [[GameState alloc] init];
    //[[GameState getGameState] loadState];
    
    
    

    // Configure the view.
    //SKView * skView = (SKView *)self.view;
    //skView.showsFPS = YES;
    //skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    //SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    //scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    //[skView presentScene:scene];
    
    
    //NSLog(@"Screen Height,Width =%f,%f",[[UIScreen mainScreen] bounds].size.height,[[UIScreen mainScreen] bounds].size.width);
    
    ////NSLog(@"VDL=%f",self.view.bounds.size.width);
    ////NSLog(@"VDL=%f",self.view.bounds.size.height);
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void) gameLevelOver:(NSNotification*) notification{
    //NSLog(@"ViewController: Level over");
    
    //[GameState getGameState].currentLevelOver = YES;
    [GameState getGameState].currentLevelEnded=YES;
    //if([GameState getGameState].currentView!=Level4View){
    if([GameState getGameState].currentLevel!=Level4View){
        [[GameState getGameState].unlockLevels
         replaceObjectAtIndex:[GameState getGameState].currentLevel//[GameState getGameState].currentView //next level index
         withObject:NSBool(YES)];
        [self refreshLevelButtonsState];
        
    }
    [self.levelUpView setHidden:NO];
    
    // [self.levelView setHidden:YES];
   // [self.mainView setHidden:NO];
    
    
}

- (void) refreshLevelButtonsState{
    
    if([GameState getGameState].unlockLevels){
        self.buttonLevel1.enabled= [[[GameState getGameState].unlockLevels objectAtIndex:0] boolValue];
        
        self.buttonLevel2.enabled= [[[GameState getGameState].unlockLevels objectAtIndex:1] boolValue];
        
        
        self.buttonLevel3.enabled=[[[GameState getGameState].unlockLevels objectAtIndex:2] boolValue];
        
        
        self.buttonLevel4.enabled=[[[GameState getGameState].unlockLevels objectAtIndex:3] boolValue];
        
        ////NSLog(@"%d",([[gameState.unlockLevels objectAtIndex:3] boolValue]));
        
    }

    
}

-(void) initializeGame{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(gameLevelOver:)
                                                 name:LevelCompleteNotification object:nil];
    
    if(self.mainView && self.levelView){
        //[self startLevel:[GameState getGameState].currentView];
        
        [self refreshLevelButtonsState];
        
    
        //if([GameState getGameState].currentView==SelectLevelView){//[GameState getGameState].currentLevelOver){
        
        ///[GameState getGameState].currentView=SelectLevelView;
            [self.mainView setHidden:NO];
            [self.levelView setHidden:YES];
        
        
        
        //if(IS_IPHONE_4){
         //scene = [StartScene sceneWithSize:CGSizeMake(640, HEIGHT_IPHONE_4)];
         //scene.scaleMode=SKSceneScaleModeAspectFill;
         
         //}
        //scene=[StartScene sceneWithSize:CGSizeMake(self.view.bounds.size.width*2.0, self.view.bounds.size.height*2)];
        // scene.scaleMode=SKSceneScaleModeAspectFill;
        
         //}else{
            // [self loadLevel:[GameState getGameState].currentView];
        
       // }
        
    }
    
    
    /*SKView* view = (SKView*) self.view;
     
     if(!view.scene){
     view.showsFPS=FALSE;
     view.showsNodeCount=FALSE;
     
     //SKScene *scene=[MyScene sceneWithSize:view.bounds.size];
     //scene.scaleMode=SKSceneScaleModeAspectFill;
     //[view presentScene:scene];
     
     SKScene *scene=[StartScene sceneWithSize:CGSizeMake(view.bounds.size.width*2.0, view.bounds.size.height*2.0)];
     //NSLog(@"%f",view.bounds.size.width);
     //NSLog(@"%f",view.bounds.size.height);
     scene.scaleMode=SKSceneScaleModeAspectFill;
     [view presentScene:scene];
     
     }*/
    
}

-(void) viewDidAppear:(BOOL)animated{
    //[self initializeGame];
    
}

-(void) viewWillAppear:(BOOL)animated{
    
    
}
-(void) viewWillDisappear:(BOOL)animated{
    //NSLog(@"View will disappear");
}

-(void) viewWillLayoutSubviews{
    //[super viewWillLayoutSubviews];
    //[self.view ]
    
    //[[UIScreen mainScreen]
    //[self.view setBounds:CGRectMake(CGRectGetMinX([[UIScreen mainScreen] bounds]), CGRectGetMinY([[UIScreen mainScreen] bounds]), 200, 200)];
    [self.view sizeThatFits:CGSizeMake(1000, 1000)];
    //NSLog(@"BoundsX:%f",CGRectGetMinX([[UIScreen mainScreen] bounds]));
    //NSLog(@"BoundsY:%f",CGRectGetMinY([[UIScreen mainScreen] bounds]));

    
    //self.view.bounds.size.height*=2;// = self.view.bounds.size.height*2;
    
    
   // [self initializeGame];
    
    
    
    
    
}

/*-(void) setupScene{
    
    //scene=[StartScene sceneWithSize:CGSizeMake(self.view.bounds.size.width*2.0, self.view.bounds.size.height*2.0)];
    
    //NSLog(@"SetupScene: Screen Height,Width =%f,%f",[[UIScreen mainScreen] bounds].size.height,[[UIScreen mainScreen] bounds].size.width);
    //NSLog(@"SetupScene: View Height,Width =%f,%f",self.view.bounds.size.height,self.view.bounds.size.width);
    
    
    [self.mainView setHidden:(YES)];
    [self.levelUpView setHidden:YES];
    [self.levelView setHidden:NO];
    
}*/
/*-(void) loadLevel:(u_int8_t) level{
    
    
    //currentLevel=level;
    [GameState getGameState].currentView=level;
    //[GameState getGameState].currentLevelOver=NO;
    
    [self setupScene];
    [scene loadLevelScene:level];
    
    [self.levelView presentScene:scene];
    
}
*/
-(void) startLevel: (u_int8_t) level{
   
        //self.adBanner.alpha=0;
    //[self animateAdBanner];
    
    [self.mainView setHidden:(YES)];
    [self.levelUpView setHidden:YES];
    [self.levelView setHidden:NO];
    
    
    if(level==[GameState getGameState].currentLevel && ![GameState getGameState].currentLevelEnded){
        [self.levelView setPaused:NO];
        [GameState getGameState].scene.view.paused=NO;
        
        [self.levelView presentScene:[GameState getGameState].scene];
        
    }else{
        [GameState getGameState].scene.view.paused=NO;
        [GameState getGameState].currentLevel=level;
        [GameState getGameState].currentLevelEnded=NO;
        //[GameState getGameState].currentView=level;
        //[GameState getGameState].currentLevelOver=NO;
        
        //[self.mainView setHidden:(YES)];
        //[self.levelUpView setHidden:YES];
        //[self.levelView setHidden:NO];
        
        //[self setupScene];
        //[self.mainView setHidden:(YES)];
        //[self.levelUpView setHidden:YES];
        //[self.levelView setHidden:NO];
        [GameState getGameState].scene=[StartScene sceneWithSize:CGSizeMake(self.view.bounds.size.width*2.0, self.view.bounds.size.height*2)];

        [[GameState getGameState].scene makeLevelScene:level];
        [self.levelView presentScene:[GameState getGameState].scene];
    }
    
    
    
}
-(IBAction)startLevel1:(id)sender{
    
    [self startLevel:Level1View];
    
    
    //[self.levelUpView setHidden:YES];
    
    //[self.mainView setHidden:(YES)];
    //[self.levelView setHidden:NO];
    //scene.gameLevel=1;
    //[scene makeLevelScene:1];
    //[self.levelView presentScene:scene];
    
}
-(IBAction)startLevel2:(id)sender{
    
    [self startLevel:Level2View];
    
    
    //[self.mainView setHidden:(YES)];
    //[self.levelView setHidden:NO];
    //scene.gameLevel=1;
    //[scene makeLevelScene:2];
    //[self.levelView presentScene:scene];
    
}
-(IBAction)startLevel3:(id)sender{
    [self startLevel:Level3View];
    
    
//    [self.mainView setHidden:(YES)];
//    [self.levelView setHidden:NO];
//    //scene.gameLevel=1;
//    [scene makeLevelScene:3];
//    [self.levelView presentScene:scene];
//    
}
-(IBAction)startLevel4:(id)sender{
    [self startLevel:Level4View];
    
//    [self.mainView setHidden:(YES)];
//    [self.levelView setHidden:NO];
//    //scene.gameLevel=1;
//    [scene makeLevelScene:4];
//    [self.levelView presentScene:scene];
//    
    //LevelViewController* levelVC=[[LevelViewController alloc] initWithNibName:@"LevelView" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:levelVC animated:YES];
    //UIStoryboard* sb = self.storyboard;
   // LevelViewController *second= [self.storyboard instantiateViewControllerWithIdentifier:@"LevelView"];
    //[self presentViewController:second animated:NO completion:nil ];//]ModalViewController:second animated:YES];
    //[self performSegueWithIdentifier:@"MainToLevelSegue" sender:self];
    
    
    ////NSLog(@"%f",self.levelView.bounds.size.width);
    ////NSLog(@"%f",self.levelView.bounds.size.height);
    
}
-(IBAction)goToMainPanel:(id)sender{
    [self.levelView setHidden:YES];
    [self.mainView setHidden:NO];
    //currentLevel=SelectLevelView;
    
    if([GameState getGameState].scene && ![GameState getGameState].currentLevelEnded){
        //[GameState getGameState].scene.view.paused=YES;
        //scene.isPaused=YES;
    }
    //[GameState getGameState].currentView=SelectLevelView;
}

-(IBAction)replayLevel:(id)sender{
    [GameState getGameState].currentLevelEnded=YES;
    [self.levelUpView setHidden:YES];
    [self startLevel:[GameState getGameState].currentLevel];//[GameState getGameState].currentView];
    
}

-(IBAction)pauseLevel:(id)sender{
    //[self.levelView setHidden:YES];
    //[self.mainView setHidden:NO];
    //currentLevel=SelectLevelView;
    
    if([GameState getGameState].scene){
        [GameState getGameState].scene.view.paused=YES;
        [self.levelUpView setHidden:NO];
        //scene.isPaused=YES;
    }
    
    
}

-(IBAction)resumeLevel:(id)sender{
    if([GameState getGameState].scene){
        [self.levelUpView setHidden:YES];
        [GameState getGameState].scene.view.paused=NO;
        //[self animateAdBanner];
        
        //scene.isPaused=YES;
    }
    
}


-(void) animateAdBanner{
    // Creates animation.
    //[UIView beginAnimations:nil context:nil];
    
    // Sets the duration of the animation to 1.
    //[UIView setAnimationDuration:1];
    //[UIView setAnimationDelay:0.1];
    ////NSLog(@"1.Views Count: %lul",self.view.subviews.count);
    
   // if(iAdsEnable){
    
        [UIView animateWithDuration:6 delay:8
            options:
         //UIViewAnimationOptionAutoreverse
         //|UIViewAnimationOptionRepeat
         UIViewAnimationOptionAllowUserInteraction
            animations:^{
               // [self.adBanner setHidden:NO];
                [self.adBanner setAlpha:0.85];
            }
            completion:^(BOOL finished){
                if(finished){
                 //[self.adBanner setAlpha:0.7];
                }
                
            }];
        
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 23 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //CGFloat newTime = time1 + time2;
            ////NSLog(@"New time: %f", newTime);
            //[self.adBanner setHidden:YES];
            
            [UIView animateWithDuration:6 delay:8
                                options:
             //UIViewAnimationOptionAutoreverse
             //|UIViewAnimationOptionRepeat
             UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                                 // [self.adBanner setHidden:NO];
                                 [self.adBanner setAlpha:0];
                             }
                             completion:^(BOOL finished){
                                 if(finished){
                                     //[self.adBanner setAlpha:0.7];
                                 }
                                 
                             }];

        });
        
        // Sets the alpha to 1.
        // We do this because we are going to have it set to 0 to start and setting it to 1 will cause the iAd to fade into view.
        //[self.adBanner setAlpha:0.5];
        
        //  Performs animation.
        //[UIView commitAnimations];
    
    //}
}
// Method is called when the iAd is loaded.
-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    //NSLog(@"Banner did load");
    if([GameState getGameState].iAdsEnable){
        [self animateAdBanner];
    }
}

// Method is called when the iAd fails to load.
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
    ////NSLog(@"banner error");
    // Creates animation.
    //[UIView beginAnimations:nil context:nil];
    
    // Sets the duration of the animation to 1.
    //[UIView setAnimationDuration:1];
    
    // Sets the alpha to 0.
    // We do this because we are going to have it set to 1 to start and setting it to 0 will cause the iAd to fade out of view.
    [self.adBanner setAlpha:0];
    
    //  Performs animation.
    //[UIView commitAnimations];
    
}

-(BOOL) bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    ////NSLog(@"Banner Action Should Begin");
    if([GameState getGameState].scene){
        //scene.paused=YES;
    }
    //////NSLog(@"2. Views Count: %lul",self.view.subviews.count);
    
    return YES;
}

-(void) bannerViewActionDidFinish:(ADBannerView *)banner{
    
    ////NSLog(@"Banner Action Did Finnish");
    
    if([GameState getGameState].scene){
        //scene.paused=YES;
        //scene.paused=NO;
        //[self.view bringSubviewToFront:self.levelView];
        [self.levelView presentScene:[GameState getGameState].scene];
        
        if([[GameState getGameState].scene isPaused]){
            ////NSLog(@"scene is paused.");
        }else{
            ////NSLog(@"scene is NOT paused.");
        }
    }
    ////NSLog(@"3. Views Count: %lul",self.view.subviews.count);
    //[scene.physicsWorld.]
    
}

-(IBAction)shareOnTwitter:(id)sender{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
       // [tweetSheet setInitialText:@"Great fun to learn iOS programming at appcoda.com!"];
        [self makeSocialNetworkMessage:tweetSheet];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    
}

-(void) makeSocialNetworkMessage:(SLComposeViewController*) controller{
    [controller setInitialText:@"Check out this cool JingaLala game! Available in the App Store"];
    [controller addImage:[UIImage imageNamed:@"icon_120.png"]];
    [controller addURL:[NSURL URLWithString:@"https://itunes.apple.com/fi/app/jingalala/id863147982?mt=8&uo=4"]];
    
}
-(IBAction)shareOnFacebook:(id)sender{
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        //[controller setInitialText:@"First post from my iPhone app"];
        [self makeSocialNetworkMessage:controller];
        
        
        [self presentViewController:controller animated:YES completion:Nil];
    }
    
}

-(IBAction)visitJingaLalaProInAppStore:(id)sender{
 
    NSString *iTunesLink = @"itms-apps://itunes.apple.com/us/app/jingalalapro/id863924365?mt=8&uo=4";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}

-(IBAction)visitDeveloperTwitter:(id)sender{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=h_kundi"]];
}

@end
