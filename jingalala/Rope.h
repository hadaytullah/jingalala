//
//  Rope.h
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

enum  RopeSwingDirection:NSUInteger{
    SWING_LEFT=-1,
    SWING_RIGHT=1
};

@interface Rope : SKNode //<SKPhysicsContactDelegate>
@property int ropeLength;
@property CGPoint ropePosition;
@property int impulseDirection;
@property NSString* ropeName;

-(void) drawRopeWithWreckingBall;
-(void) drawRope;
-(void) jiggle;
-(u_int8_t) getRopeWidth;



//-(void) drawRopeAtPoint:(CGPoint) point ofSize:(int) size withWreckingBall:(BOOL) attachWreckingBall;

@end
