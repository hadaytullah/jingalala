//
//  SingleRope.m
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "SingleWreckingBall.h"
#import "Bucket.h"
#import "Rope.h"
#import "Ball.h"


@interface SingleWreckingBall(){
    
    //Bucket* bucket;
    //Ball* ball;
    
    Rope* rope;
    
    //int numberOfBalls;
    //int gameLevel;
    
    
    
}
@end

@implementation SingleWreckingBall

-(id) init{
    if(self=[super init]){
        //bucket=[[Bucket alloc]init];
        rope=[[Rope alloc]init];
        //ball=[[Ball alloc] init];
        //numberOfBalls=5;
        //gameLevel=4;
        
        
        
        
    }
    
    return self;
}

-(void) drawLevel{
    
    numberOfBalls = 7;
    
    [super drawCommonNodes];
    
    //[self.scene addChild:bucket];
    [self.scene addChild:rope];
    
    //[self.scene addChild:ball];
    
    //self.scene.physicsWorld.contactDelegate=ball;
    
    //int currentGameLevel=4;
    //CGFloat bucketWidth = 400.0;
    //CGFloat bucketHeight = 10;
    
    //CGPoint bucketPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    //CGSize bucketSize= CGSizeMake(bucketWidth, bucketHeight);
    
    //Bucket* bucket=[[Bucket alloc]init];
    //[self addChild:bucket];
    
    //[bucket drawLargeBucket];
    
    //drawBucketAtPoint2:bucketPosition size:bucketSize];
    
    
    
    //int numberOfBalls = 10;
    //Ball* ball=[[Ball alloc]init];
    //[self addChild:ball];
    //ball.numberOfBalls=numberOfBalls;
    //[ball drawBalls];
    
    //[self drawBalls:numberOfBalls];
    
    
    
    CGPoint ropeAtCenterPosition = CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMidY(self.scene.frame)+self.scene.size.width/4);
    
    //Rope* rope=[[Rope alloc]init];
    //[self addChild:rope];
    
    rope.ropePosition=ropeAtCenterPosition;
    //rope.ropeLength=13;
    
    [rope drawRopeWithWreckingBall];
    //[rope drawRopeAtPoint:ropeAtCenterPosition ofSize:12 withWreckingBall:YES];
    
    
    /*CGPoint ropeTwoPosition = CGPointMake(CGRectGetMidX(self.frame)/2, ropeAtCenterPosition.y);
     [self drawRopeAtPoint:ropeTwoPosition withWreckingBall:NO];
     
     CGPoint ropeThreePosition = CGPointMake(CGRectGetMidX(self.frame)+CGRectGetMidX(self.frame)/2.0, ropeAtCenterPosition.y);
     [self drawRopeAtPoint:ropeThreePosition withWreckingBall:NO];
     */
    //CGPoint ropeFourPosition = CGPointMake(CGRectGetMidX(self.frame), ropeAtCenterPosition.y);
    //[self drawRopeAtPoint:ropeFourPosition];
    
    
    //[self drawRopeAtPoint:ropeOnePosition];
    
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    //[ball touchesBegan:touches withEvent:event];
    [rope touchesBegan:touches withEvent:event];
    //[ball isAnyBallOnFloor];
}

@end
