//
//  HangingRopes.m
//  WreckingBall
//
//  Created by Hadaytullah on 28/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "HangingRopes.h"
#import "Rope.h"

@interface HangingRopes(){
    
    Rope* ropeOne;
    Rope* ropeTwo;
    Rope* ropeThree;
    
    int ropeSize;
}
@end

@implementation HangingRopes

-(id) init{
    
    if(self=[super init]){
       
        //ropeOne=[[Rope alloc] init];
        ropeTwo=[[Rope alloc] init];
        ropeThree=[[Rope alloc] init];
        ropeSize=7;
        
        
    }
    return self;
}
/*-(void) jiggleAllRopes{
    SKAction* jiggleAction=[SKAction runBlock:^{
        [ropeOne jiggle];
        sleep(3);
    }];
    [ropeOne runAction:[SKAction repeatActionForever:jiggleAction]];
}*/

-(void) drawLevel{
    //numberOfBalls=7;
    [super drawCommonNodes];
    
    //[self.scene addChild:ropeOne];
    [self.scene addChild:ropeTwo];
    [self.scene addChild:ropeThree];
    
    
    CGPoint ropeAtCenterPosition = CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMidY(self.scene.frame)+self.scene.size.width/4);
    //ropeOne.ropePosition = ropeAtCenterPosition;
    //ropeOne.ropeLength=ropeSize;
    
    //[ropeOne drawRopeWithWreckingBall];
    
    
    
    
    CGPoint ropeTwoPosition = CGPointMake(CGRectGetMidX(self.scene.frame)/1.5, ropeAtCenterPosition.y);
    ropeTwo.ropePosition=ropeTwoPosition;
    ropeTwo.ropeLength=ropeSize;
    //ropeTwo.impulseDirection=
    
    [ropeTwo drawRopeWithWreckingBall];
     
    CGPoint ropeThreePosition = CGPointMake(CGRectGetMidX(self.scene.frame)+CGRectGetMidX(self.scene.frame)/3.0, ropeAtCenterPosition.y);
    ropeThree.ropePosition=ropeThreePosition;
    ropeThree.ropeLength=ropeSize;
    
    [ropeThree drawRopeWithWreckingBall];
    
    //[self jiggleAllRopes];
    
    //[self.scene performSelectorInBackground:@selector(jiggleAllRopes:) withObject:nil];

    
    //NSThread* myThread = [[NSThread alloc] initWithTarget:self
      //                                           selector:@selector(jiggleAllRopes:)
        //                                           object:nil];
    //[myThread start];  // Actually create the thread
    //[ropeOne jiggle];
    //[ropeTwo jiggle];
    //[ropeThree jiggle];
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [ropeOne touchesBegan:touches withEvent:event];
    [ropeTwo touchesBegan:touches withEvent:event];
    [ropeThree touchesBegan:touches withEvent:event];
}

@end
