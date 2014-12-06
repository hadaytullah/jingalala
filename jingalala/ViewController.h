//
//  ViewController.h
//  WreckingBall
//

//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate>

@property IBOutlet ADBannerView* adBanner;
@property IBOutlet UIButton* buttonLevel1;
@property IBOutlet UIButton* buttonLevel2;
@property IBOutlet UIButton* buttonLevel3;
@property IBOutlet UIButton* buttonLevel4;
@property IBOutlet UIButton* buttonTwitter;
@property IBOutlet UIButton* buttonFacebook;

@property IBOutlet UIView* mainView;
@property IBOutlet SKView* levelView;
@property IBOutlet UIView* levelUpView;

-(IBAction)startLevel1:(id)sender;
-(IBAction)startLevel2:(id)sender;
-(IBAction)startLevel3:(id)sender;
-(IBAction)startLevel4:(id)sender;

-(IBAction)goToMainPanel:(id)sender;
-(IBAction)replayLevel:(id)sender;
-(IBAction)pauseLevel:(id)sender;
-(IBAction)resumeLevel:(id)sender;

-(IBAction)shareOnTwitter:(id)sender;
-(IBAction)shareOnFacebook:(id)sender;

-(IBAction)visitJingaLalaProInAppStore:(id)sender;
-(IBAction) visitDeveloperTwitter:(id)sender;

@end
