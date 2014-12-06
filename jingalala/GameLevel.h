//
//  GameLevel.h
//  WreckingBall
//
//  Created by Hadaytullah on 27/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Level.h"
#import "Ball.h"
#import "Bucket.h"

@interface GameLevel : SKNode <SKPhysicsContactDelegate>
{
    Ball* ball;
    Bucket *bucket;
    u_int8_t numberOfBalls;
    u_int8_t numberOfBuckets;
    SKSpriteNode* floorNode;
    SKPhysicsJointPin* joinBallToWreckingBall;
    BOOL joinOnTouch;
    BOOL isEnemySticky;
    
    //BOOL levelAlreadyOver;
}

@property BOOL levelOver;
//@property BOOL loadBalls;

-(void) drawCommonNodes;
-(void) sceneUpdated;
-(void) makeEnemyMoreSticky;
//-(void) enableJoinOnTouch;
//-(void) drawCommonNodes2;


@end
