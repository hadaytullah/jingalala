//
//  Ball.m
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "Ball.h"
#import "SharedResources.h"
#import "GameState.h"

@interface Ball(){
    NSMutableArray *ballsArray;
    NSMutableArray* ballAnimationFrames1;
    NSMutableArray* ballAnimationFrames2;
    BOOL alternateAnimation;
    int xImpulse;
    int yImpulse;
    
    //CGFloat ballMass;

}
@end

@implementation Ball

-(id) init{
    if(self=[super init]){
        self.numberOfBalls=1;
        self.locationPoint= CGPointMake(200,100);
        //CGRectGetMidX(self.scene.frame), CGRectGetMidY(self.scene.frame));
        ballsArray=[NSMutableArray array];
        xImpulse=1000;
        yImpulse=2000;
        
        ballAnimationFrames1=[NSMutableArray array];
        
        [ballAnimationFrames1 addObject:[SKTexture textureWithImageNamed:ballImageFile]];
        [ballAnimationFrames1 addObject:[SKTexture textureWithImageNamed:ballImageFile2]];
        [ballAnimationFrames1 addObject:[SKTexture textureWithImageNamed:ballImageFile3]];
        
        ballAnimationFrames2=[NSMutableArray array];
        
        [ballAnimationFrames2 addObject:[SKTexture textureWithImageNamed:ballImageFile2]];
        [ballAnimationFrames2 addObject:[SKTexture textureWithImageNamed:ballImageFile]];
        [ballAnimationFrames2 addObject:[SKTexture textureWithImageNamed:ballImageFile3]];
        
        alternateAnimation=YES;
        
        //ballMass=1.0;
        
        
    }
    return self;
}

/*-(void) storeBalls{
    if([GameState getGameState].ballsPosition){
        [[GameState getGameState].ballsPosition removeAllObjects];
        [GameState getGameState].ballsPosition= ballsArray;//[NSMutableArray arrayWithArray:ballsArray];
    }
    
}*/

/*-(void) loadBalls{
    
    if([GameState getGameState].ballsPosition){
    
        for(SKSpriteNode* ball in [GameState getGameState].ballsPosition){
            [self.scene addChild:ball];
            [self runActionOnBall:ball];
        }
    }
}*/

-(void) drawBalls{
    
    /*NSMutableArray* ballsArray = [GameState getGameState].ballsPosition;
    [ballsArray removeAllObjects];*/
    
    
    for (int i=1; i<=self.numberOfBalls; i++) {
        
        
        SKSpriteNode * ball = [SKSpriteNode spriteNodeWithImageNamed:ballImageFile];
        [ballsArray addObject:ball];
        
        
        ball.position = self.locationPoint;
        //CGPointMake(CGRectGetMidX(self.frame),CGRectGetMinY(self.frame));
        
        //CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        //[structureComponents addObject:ball];
        [self.scene addChild:ball];
        //[self.scene ]
        
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width/2.0];
        ball.physicsBody.mass=BallMass;
        ball.physicsBody.categoryBitMask=BallCategory;
        
        ball.physicsBody.collisionBitMask=BallCategory|BucketCategory;//|WreckingBallPunchCategory|WreckingBallCategory;
        ball.physicsBody.contactTestBitMask=BallCategory|BucketCategory;//|WreckingBallCategory|WreckingBallPunchCategory;
        
        ball.physicsBody.dynamic=YES;
        ball.physicsBody.affectedByGravity=YES;
        ball.physicsBody.friction=BallFriction;
        
        
        [self runActionOnBall:ball];
        
        
        
        
        //ball.physicsBody.mass=ballMass;
        
        
    }
    
}

-(void) runActionOnBall:(SKSpriteNode*) ball{
    
    if(alternateAnimation){
        [ball runAction:[SKAction repeatActionForever:
                         [SKAction animateWithTextures:ballAnimationFrames1
                                          timePerFrame:4
                                                resize:NO
                                               restore:YES]] withKey:@"ball_frames"];
        alternateAnimation=NO;
    }else{
        
        [ball runAction:[SKAction repeatActionForever:
                         [SKAction animateWithTextures:ballAnimationFrames2
                                          timePerFrame:2.5
                                                resize:NO
                                               restore:YES]] withKey:@"ball_frames"];
        alternateAnimation=YES;
        
    }
    
}

//- (void) didBeginContact:(SKPhysicsContact *)contact{
  //  NSLog(@"didBeginContact:Ball");
    
    /*if(contact.bodyA.categoryBitMask==BallCategory && contact.bodyB.categoryBitMask==BallCategory){
     if(contact.collisionImpulse>(contact.bodyA.mass*100.0)){
     
     //[self runAction:[SKAction playSoundFileNamed:soundBallsCollisionFile waitForCompletion:NO]];
     }
     }*/
    
    /*if(contact.bodyA.categoryBitMask==BallCategory && contact.bodyB.categoryBitMask==FloorCategory){
        
        if(contact.collisionImpulse>(contact.bodyA.mass*100.0)){
            
            [self runAction:[SKAction playSoundFileNamed:soundBallsCollisionFile waitForCompletion:NO]];
        }
    }else if(contact.bodyA.categoryBitMask==FloorCategory && contact.bodyB.categoryBitMask==BallCategory){
        
        if(contact.collisionImpulse>(contact.bodyB.mass*100.0)){
            
            [self runAction:[SKAction playSoundFileNamed:soundBallsCollisionFile waitForCompletion:NO]];
        }
        
    }*/
    
    //if([self isAnyBallOnFloor]==NOT_ON_FLOOR){
        
    //}
    
    //contact.bodyA
    //[wreckingBall.wreckingBallShapeNode.physicsBody applyImpulse:CGVectorMake(3, 10)];
    
//}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"Balls: Touched");
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.scene];
    
    
    NSArray* nodesAtTouch= [self.scene nodesAtPoint:touchPoint];
    
    for(SKNode* node in nodesAtTouch){
        
        CGFloat xImpulseVector= (node.physicsBody.mass)*xImpulse;
        CGFloat yImpulseVector= (node.physicsBody.mass)*yImpulse;
        
        //CGFloat cylinderXImpulseFactor = (wreckingBallCylinder.physicsBody.mass)*5000;
        //CGFloat cylinderYImpulseFactor= (wreckingBallCylinder.physicsBody.mass)*1000;
        
        if(node.physicsBody.categoryBitMask==BallCategory){
           
            [node runAction:[SKAction playSoundFileNamed:soundWhistleFile waitForCompletion:NO]];

            if(node.position.x>CGRectGetMidX(self.scene.frame)){
                
                [node.physicsBody applyImpulse:CGVectorMake(-1.0*xImpulseVector, yImpulseVector)];
                
                
    //       if(currentGameLevel==4 && node.physicsBody.categoryBitMask==BallCategory){
    //                if(wreckingBallCylinder){
    //                    [wreckingBallCylinder.physicsBody applyImpulse:CGVectorMake(1.0*cylinderXImpulseFactor,cylinderYImpulseFactor)];
    //                    NSLog(@"cylinder moved");
    //                }
    //            }
                
                
            }else{
                
                [node.physicsBody applyImpulse:CGVectorMake(xImpulseVector, yImpulseVector)];
                
    //            if(currentGameLevel==4 && node.physicsBody.categoryBitMask==BallCategory){
    //                if(wreckingBallCylinder){
    //                    [wreckingBallCylinder.physicsBody applyImpulse:CGVectorMake(-1.0*cylinderXImpulseFactor,cylinderYImpulseFactor)];
    //                    NSLog(@"cylinder moved");
    //                }
    //            }
            }
        }
        
        
        
        //[node.physicsBody applyAngularImpulse:(10.0) ];// CGVectorMake(1000,10000)];
    }
    
    [self isAnyBallOnFloor];
    
}

-(NSUInteger) isAnyBallOnFloor{
    //NSMutableArray* ballsArray=[GameState getGameState].ballsPosition;
    
    if(!ballsArray){
        return UN_DECIDED;
    }
    
    SKSpriteNode* ball=[ballsArray objectAtIndex:0];
    
    CGPoint lowPointThreshold = CGPointMake(CGRectGetMinX(self.scene.frame), CGRectGetMinY(self.scene.frame)+ ball.size.height*2);
    
    CGPoint lowestBallPosition= CGPointMake(ball.position.x,ball.position.y);//lowPoint.x+10,lowPoint.y-10);
    
   
    for(SKSpriteNode* ball in ballsArray){
        //NSLog(@"Velocity (x,y): %f,%f",fabsf(ball.physicsBody.velocity.dx),fabsf(ball.physicsBody.velocity.dy));
        if((fabsf(ball.physicsBody.velocity.dy))>0.7 || fabsf((ball.physicsBody.velocity.dx))>0.7){
        //if(!ball.physicsBody.resting){
            //NSLog(@"Balls moving, undecided");
            return UN_DECIDED;
        }
        
        if(ball.position.y<lowestBallPosition.y){
            lowestBallPosition.x=ball.position.x;
            lowestBallPosition.y=ball.position.y;
        }
    }


    if(lowestBallPosition.y<lowPointThreshold.y){
        //NSLog(@"Balls on floor.");
        return ON_FLOOR;
    }
    
    
    //NSLog(@"Balls in bucket.");
    
    return NOT_ON_FLOOR;
    
}

-(BOOL) isBallsMoving{
    //NSMutableArray* ballsArray=[GameState getGameState].ballsPosition;
    
    if(ballsArray){
        for(SKSpriteNode* ball in ballsArray){
            if(ball.physicsBody.velocity.dx!=0.0 || ball.physicsBody.velocity.dy!=0.0){
               //NSLog(@"Balls moving");
                return YES;
            }
        }
    }
   //NSLog(@"Balls not moving");
    return NO;
    
}


@end
