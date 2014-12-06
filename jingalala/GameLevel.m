//
//  GameLevel.m
//  WreckingBall
//
//  Created by Hadaytullah on 27/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "GameLevel.h"
#import "Ball.h"
#import "SharedResources.h"
#import "GameState.h"

@implementation GameLevel

-(id) init{
    if(self=[super init]){
        ball=[[Ball alloc] init];
        bucket=[[Bucket alloc] init];
        numberOfBalls=5;
        numberOfBuckets=1;
        self.levelOver=NO;
        joinOnTouch=YES;
        isEnemySticky=NO;
        //[[NSNotificationCenter defaultCenter] addObserver:self
         //                                        selector:@selector(storeLevelData)
           //                                          name:StoreLevelData object:nil];
        
       // self.loadBalls=NO;
        //self.scene.physicsWorld.contactDelegate=ball;
        
    }
    
    return self;
}

/*-(void) storeLevelData{
    NSLog(@"Storing level data.");
    [ball storeBalls];
    
}*/

-(void) makeEnemyMoreSticky{
    isEnemySticky=YES;
}
-(void) drawCommonNodes{
    
    SKSpriteNode *backGroundImageNode = [SKSpriteNode spriteNodeWithImageNamed:@"background.png"];
    [self.scene addChild:backGroundImageNode];
    backGroundImageNode.position=CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMidY(self.scene.frame));
    
   //NSLog(@"SceneFrame H,W:%f,%f",self.scene.frame.size.height,self.scene.frame.size.width);

   //NSLog(@"Scene H,W:%f,%f",self.scene.size.height,self.scene.size.width);
    //self.scene.size.height

    floorNode=[SKSpriteNode spriteNodeWithImageNamed:imageFloor];
    [self.scene addChild:floorNode];
    floorNode.position=CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMinY(self.scene.frame));
    floorNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:floorNode.size];
    //floorNode.physicsBody.affectedByGravity=YES;
    floorNode.physicsBody.dynamic=NO;
    //floorNode.physicsBody.categoryBitMask=FloorCategory;
    
    [self.scene addChild:bucket];
    
    [bucket drawLargeBucket];
    
    
    
    [self.scene addChild:ball];
    
    
    //if(!self.loadBalls){
        ball.numberOfBalls=numberOfBalls;
        //self.scene.physicsWorld.contactDelegate=ball;
        [ball drawBalls];
    //}else{
      //  [ball loadBalls];
    //}
    
    
    
    
    
}


/*-(void) drawCommonNodes2{
    
    // SKSpriteNode *backGroundImageNode = [SKSpriteNode spriteNodeWithImageNamed:@"background.png"];
    //[self.scene addChild:backGroundImageNode];
    //backGroundImageNode.position=CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMidY(self.scene.frame));
    
    
    floorNode=[SKSpriteNode spriteNodeWithImageNamed:imageFloor];
    [self.scene addChild:floorNode];
    floorNode.position=CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMinY(self.scene.frame));
    floorNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:floorNode.size];
    //floorNode.physicsBody.affectedByGravity=YES;
    floorNode.physicsBody.dynamic=NO;
    //floorNode.physicsBody.categoryBitMask=FloorCategory;
    
    
    
    [self.scene addChild:ball];
    
    ball.numberOfBalls=numberOfBalls;
    //self.scene.physicsWorld.contactDelegate=ball;
    [ball drawBalls];
    
    
    //[self.scene addChild:bucket];
    
    //[bucket drawLargeBucket];
    
    
    
}*/


-(void) sceneUpdated{
    //NSLog(@"Scene updated.");
    if([ball isAnyBallOnFloor]==NOT_ON_FLOOR && joinBallToWreckingBall==Nil){
        [self levelOverSuccess];
    }
}

- (void) levelOverSuccess{
    //self.levelOver=YES;
    
   //NSLog(@"Level up");
    [[NSNotificationCenter defaultCenter]
     postNotificationName:LevelCompleteNotification object:self];
    
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [ball touchesBegan:touches withEvent:event];
    
}

-(void) disableJoinOnTouch{
    joinOnTouch=NO;
    
}

-(void) enableJoinOnTouch{
    joinOnTouch=YES;
}
-(void) didBeginContact:(SKPhysicsContact *)contact{
    
    //NSLog(@"didBeginContact:double bucket");
    
    if (joinOnTouch &&
        ((contact.bodyA.categoryBitMask==WreckingBallCategory && contact.bodyB.categoryBitMask==BallCategory) ||
        (contact.bodyA.categoryBitMask==BallCategory && contact.bodyB.categoryBitMask==WreckingBallCategory))) {
        
        SKPhysicsBody* wreckingBallBody;
        SKPhysicsBody* ballBody;
        if(contact.bodyA.categoryBitMask==BucketCategory){
            wreckingBallBody=contact.bodyA;
            ballBody=contact.bodyB;
        }else{
            wreckingBallBody=contact.bodyB;
            ballBody=contact.bodyA;
        }
        
        if(joinBallToWreckingBall){//a ball already hanging from wreckingball
            [self.scene.physicsWorld removeJoint:joinBallToWreckingBall];
            joinBallToWreckingBall=Nil;
            
            if(!isEnemySticky){
                [self disableJoinOnTouch];
            
                [self performSelector:@selector(enableJoinOnTouch) withObject:nil afterDelay:2.0f];
            }
            
        }else{
            
            
            joinBallToWreckingBall=[SKPhysicsJointPin jointWithBodyA:
                                    wreckingBallBody
                                                               bodyB:ballBody
                                                              anchor:contact.contactPoint];
            //CGPointMake(CGRectGetMidX(bucketSectionBody.node.frame),(CGRectGetMinY(bucketSectionBody.node.frame)))]  ;
            
            
            //[self.scene addChild:currentRopeSection];
            [self.scene.physicsWorld addJoint:joinBallToWreckingBall];
        }
        
    }
}

@end
