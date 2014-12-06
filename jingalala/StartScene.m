//
//  StartScene.m
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "StartScene.h"
#import "SharedResources.h"
#import "Rope.h"
#import "Bucket.h"
#import "Ball.h"
#import "SingleWreckingBall.h"
#import "HangingRopes.h"
#import "DoubleBucket.h"
#import "StickPunch.h"

//static StartScene* startScene;

@interface StartScene(){
    
    
    //SingleWreckingBall* singleWreckingBallLevel;
    GameLevel* currentGameLevel;
    NSTimeInterval previousTimeStamp;
}

@end

@implementation StartScene

/*-(StartScene*) getScene{
    if(!startScene){
        
    }
    
}*/

-(id) initWithSize:(CGSize)size{
    self=[super initWithSize:size];
    
    if(self){
        
        //[self setBackgroundImage];
        //self.gameLevel=1;
        
        //self.size = size;
        
        
        self.physicsBody=[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.physicsWorld.gravity=CGVectorMake(-0.1, -9.8);//earth's gravity on y axis
        
        
        previousTimeStamp=0;
        
        
        
      
        
    }
    
    return self;
}

-(void) clearScene{
    [self removeAllChildren];
    self.physicsWorld.contactDelegate=Nil;
    
    
}

/*-(void) loadLevelScene:(u_int8_t)gameLevel{
    [self initializeLevelScene:gameLevel load:YES];
}*/
-(void) makeLevelScene:(u_int8_t)gameLevel{
    [self initializeLevelScene:gameLevel load:NO];
}

-(void) initializeLevelScene:(u_int8_t) gameLevel load:(BOOL) load{
    
    [self clearScene];
    
    switch (gameLevel) {
        case Level2View:{
            SingleWreckingBall* singleWreckingBallLevel=[[SingleWreckingBall alloc] init];
            currentGameLevel=singleWreckingBallLevel;
            [self addChild:singleWreckingBallLevel];
            self.physicsWorld.contactDelegate=singleWreckingBallLevel;
            
            //singleWreckingBallLevel.loadBalls=load;
            [singleWreckingBallLevel drawLevel];
            
            
            
        }
            
            break;
        case Level4View:{
            HangingRopes* hangingRopesLevel=[[HangingRopes alloc] init];
            currentGameLevel=hangingRopesLevel;
            [self addChild:hangingRopesLevel];
            self.physicsWorld.contactDelegate=hangingRopesLevel;
            //hangingRopesLevel.loadBalls=load;
            
            [hangingRopesLevel drawLevel];
            
        }
            
            break;
        case Level1View:{
            DoubleBucket* doubleBucketLevel=[[DoubleBucket alloc] init];
            currentGameLevel=doubleBucketLevel;
            [self addChild:doubleBucketLevel];
            self.physicsWorld.contactDelegate=doubleBucketLevel;
            
            //doubleBucketLevel.loadBalls=load;
            [doubleBucketLevel drawLevel];
        }
            break;
            
        case Level3View:{
            StickPunch* stickPunchLevel=[[StickPunch alloc] init];
            currentGameLevel=stickPunchLevel;
            [self addChild:stickPunchLevel];
            self.physicsWorld.contactDelegate=stickPunchLevel;
            //stickPunchLevel.loadBalls=load;
            [stickPunchLevel drawLevel];

        }
            break;
            
        default:
            break;
    }
}

-(void) setBackgroundImage {
    
    SKSpriteNode *backGroundImageNode = [SKSpriteNode spriteNodeWithImageNamed:@"background.png"];
    [self addChild:backGroundImageNode];
    backGroundImageNode.position=CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"StartScene: Touch Begins");
   
    if(currentGameLevel){
        [currentGameLevel touchesBegan:touches withEvent:event];
    }
    
    [super touchesBegan:touches withEvent:event];
}

-(void) update:(NSTimeInterval)currentTime{
    if(currentTime-previousTimeStamp>2){
        if(currentGameLevel){
            if(!currentGameLevel.levelOver){
                [currentGameLevel sceneUpdated];
            }
        }
        //[currentGameLevel sceneUpdated];
        previousTimeStamp=currentTime;

    }
}



@end
