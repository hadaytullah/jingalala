//
//  Ball.h
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

enum  BallsState:NSUInteger{
     UN_DECIDED,
     ON_FLOOR,
     NOT_ON_FLOOR
};
//typedef NSUInteger BallsState;

@interface Ball : SKNode //<SKPhysicsContactDelegate>


@property CGPoint locationPoint;
@property u_int8_t numberOfBalls;



//-(void) drawBall;
-(void) drawBalls;
-(BOOL)isBallsMoving;

//-(void) storeBalls;
//-(void) loadBalls;

-(NSUInteger) isAnyBallOnFloor;



@end
