//
//  DoubleBucket.m
//  WreckingBall
//
//  Created by Hadaytullah on 31/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "DoubleBucket.h"
#import "Rope.h"
#import "Bucket.h"
#import "SharedResources.h"

@interface DoubleBucket(){
    u_int8_t numberOfRopes;
    u_int8_t ropeLength;
    
    Ball* ball;
    Bucket* bucketOne;
    //Bucket* bucketTwo;
    
    Rope* ropeOne;
    NSMutableArray* ropeArray;
    Rope* ropeTwo;
    
    
    //SKPhysicsJointPin* joinBallToWreckingBall;
    
}
@end

@implementation DoubleBucket

-(id) init{
    if(self=[super init]){
        
        ball=[[Ball alloc] init];
        
        bucketOne=[[Bucket alloc] init];
        //bucketTwo=[[Bucket alloc] init];
        
        ropeOne=[[Rope alloc] init];
        ropeTwo=[[Rope alloc] init];
        
        ropeArray=[NSMutableArray array];
        
        numberOfRopes=6;
        ropeLength=1;
        
    }
    
    return self;
}

-(void) drawLevel{
    
    numberOfBalls = 7;
    [self makeEnemyMoreSticky];
    
    [super drawCommonNodes];
    
    //[self.scene addChild:bucket];
    //[self.scene addChild:ropeOne];
    
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
    
    
    
    CGPoint centerPosition = CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMaxY(self.scene.frame)*0.95);
    
    Rope* ropeAtCenter=[[Rope alloc] init];
    [self.scene addChild:ropeAtCenter];
    ropeAtCenter.ropeLength=ropeLength;
    ropeAtCenter.ropePosition=centerPosition;
    [ropeAtCenter drawRopeWithWreckingBall];
    
    CGPoint ropePosition = CGPointMake(centerPosition.x - [ropeAtCenter getRopeWidth], centerPosition.y);
    
    for(u_int8_t r=1;r<=numberOfRopes/2;r++){
        Rope *rope= [[Rope alloc] init];
        [self.scene addChild:rope];
        //[ropeArray addObject:rope];
        rope.ropeLength=ropeLength;
        rope.ropePosition= ropePosition;
        [rope drawRopeWithWreckingBall];
        
        ropePosition.x= ropePosition.x-[rope getRopeWidth];
        
    }
    
    ropePosition = CGPointMake(centerPosition.x + [ropeAtCenter getRopeWidth], centerPosition.y);
    for(u_int8_t r=1;r<=numberOfRopes/2;r++){
        Rope *rope= [[Rope alloc] init];
        [self.scene addChild:rope];
        //[ropeArray addObject:rope];
        rope.ropeLength=ropeLength;
        rope.ropePosition= ropePosition;
        [rope drawRopeWithWreckingBall];
        
        ropePosition.x= ropePosition.x+[rope getRopeWidth];
        
    }
    
    //Rope* rope=[[Rope alloc]init];
    //[self addChild:rope];
    
    //ropeOne.ropePosition=ropeAtCenterPosition;
    //rope.ropeLength=13;
    
    //[ropeOne drawRopeWithWreckingBall];
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
/*-(void) drawLevel_old{
    
    numberOfBalls=5;
    [super drawCommonNodes2];

    
    //[self.scene addChild:ropeOne];
    [self.scene addChild:ropeTwo];
    [self.scene addChild:ropeOne];
    [self.scene addChild:bucketOne];
    
    bucketOne.bucketWidth=CGRectGetMaxX(self.scene.frame)*0.8;
    bucketOne.bucketPosition=CGPointMake(
                        CGRectGetMidX(self.scene.frame),//-(bucketOne.bucketWidth/2.0),
                        CGRectGetMaxY(self.scene.frame)*0.85);
    [bucketOne drawLargeBucket];
    
    
    
    CGPoint ropeAtCenterPosition = CGPointMake(CGRectGetMidX(self.scene.frame),
                                    CGRectGetMaxY(self.scene.frame)*0.75);
                                               
                                               //CGRectGetMidY(self.scene.frame));//+self.scene.size.width/4);
    //ropeOne.ropePosition = ropeAtCenterPosition;
    //ropeOne.ropeLength=ropeSize;
    
    //[ropeOne drawRopeWithWreckingBall];
    
    
    
    
    CGPoint ropeTwoPosition = CGPointMake(CGRectGetMidX(self.scene.frame)/2, ropeAtCenterPosition.y);
    ropeTwo.ropePosition=ropeTwoPosition;
    //ropeTwo.ropeLength=ropeSize;
    //ropeTwo.impulseDirection=
    
    [ropeTwo drawRopeWithWreckingBall];
    
    CGPoint ropeThreePosition = CGPointMake(CGRectGetMidX(self.scene.frame)+CGRectGetMidX(self.scene.frame)/2.0, ropeAtCenterPosition.y);
    ropeOne.ropePosition=ropeThreePosition;
    //ropeOne.ropeLength=ropeSize;
    
    [ropeOne drawRopeWithWreckingBall];
    
    //[self jiggleAllRopes];
    
    //[self.scene performSelectorInBackground:@selector(jiggleAllRopes:) withObject:nil];
    
    
    //NSThread* myThread = [[NSThread alloc] initWithTarget:self
    //                                           selector:@selector(jiggleAllRopes:)
    //                                           object:nil];
    //[myThread start];  // Actually create the thread
    //[ropeOne jiggle];
    //[ropeTwo jiggle];
    
    
    
    
}*/
/*-(void) didBeginContact:(SKPhysicsContact *)contact{
    NSLog(@"didBeginContact:double bucket");
    
    if ((contact.bodyA.categoryBitMask==WreckingBallCategory && contact.bodyB.categoryBitMask==BallCategory) ||
        (contact.bodyA.categoryBitMask==BallCategory && contact.bodyB.categoryBitMask==WreckingBallCategory)) {
        
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
            joinBallToWreckingBall=nil;
            
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
}*/

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [ropeOne touchesBegan:touches withEvent:event];
    [ropeTwo touchesBegan:touches withEvent:event];
    
}

@end
