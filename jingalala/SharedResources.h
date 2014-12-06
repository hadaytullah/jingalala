//
//  SharedResources.h
//  WreckingBall
//
//  Created by Hadaytullah on 16/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#ifndef WreckingBall_SharedResources_h
#define WreckingBall_SharedResources_h

#define HEIGHT_IPHONE_5 1136
#define HEIGHT_IPHONE_4 960

#define IS_IPHONE   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds ].size.height == HEIGHT_IPHONE_5 )
#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds ].size.height == HEIGHT_IPHONE_4 )


#define kNSTrue         ((id) kCFBooleanTrue)
#define kNSFalse        ((id) kCFBooleanFalse)
#define NSBool(x)       ((x) ? kNSTrue : kNSFalse)


//enums

static const NSString* KeyBallsArray=@"ballsArray";
static const NSString* KeyCurrentViewInt=@"currentView";
static const NSString* KeyCurrentLevelOverBool=@"currentLevelOver";
static const NSString* KeyUnlockLevelsArray=@"unlockLevels";



enum Views{
    SelectLevelView,
    Level1View,
    Level2View,
    Level3View,
    Level4View
};

//bundle strings
static NSString* AdsFreeBundle=@"com.hadaytullah.ios.JingaLalaPro";

//data
static NSString* DataKey=@"com.hadaytullah.ios.jingaLala1";//@"vertical_block_green";


//levels
static const u_int8_t totalLevels=4;

//categories of elements
static const uint32_t WreckingBallCategory=0x1<<0;
static const uint32_t BlockCategory=0x1<<1;

static const uint32_t BallCategory=0x1<<2;
static const uint32_t FloorCategory=0x1<<3;

static const uint32_t BucketCategory=0x1<<4;
static const uint32_t WreckingBallPunchCategory=0x1<<5;



//Images file names
static NSString* VerticalBlockImageFile=@"vertical_block_1_3";//@"vertical_block_green";
static NSString* HorizontalBlockImageFile=@"horizontal_block_3_1";//@"horizontal_block";

static NSString* ballImageFile=@"yello_jinga1.png";//ball.png";
static NSString* ballImageFile2=@"yello_jinga2.png";
static NSString* ballImageFile3=@"yello_jinga3.png";
static NSString* imageFloor=@"floor.png";



static NSString* HorizontalRopeSectionFile=@"bucket_section.png";//@"horizontal_block.png";//@"horizontal_block_3_1.png";
static NSString* VerticalRopeSectionFile=@"bucket_section.png";//ropesection.png";
static NSString* RopeHangerFile=@"ropehanger.png";

static NSString* WreckingBallImageFile=@"angry_block1.png";//wrecking_cylinder.png";
static NSString* WreckingBallImageFile2=@"angry_block2.png";//wrecking_cylinder.png";
static NSString* WreckingBallImageFile3=@"angry_block3.png";//wrecking_cylinder.png";


//sounds
static NSString* soundBallsCollisionFile =@"ouch.wav";//ball_collide.wav";
static NSString* soundChainMovedFile=@"chain.wav";
static NSString* soundWhistleFile=@"whistle.wav";


//names
static NSString* namePunchRope=@"punch";


//events
static NSString* LevelCompleteNotification=@"event_level_completed";
//static NSString* StoreLevelData=@"event_store_level_data";


//physics constants
static const CGFloat BallMass=2;
static const CGFloat BallFriction=5;
static const CGFloat BucketSectionMass=1;
static const CGFloat RopeSectionMass=1;
static const CGFloat WreckingBallMass=2;

#endif
