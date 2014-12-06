//
//  Bucket.m
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "Bucket.h"
#import "SharedResources.h"

@implementation Bucket

-(id) init{
    if(self=[super init]){
        self.numberOfBucket=1;
        self.bucketWidth=400;
        self.bucketPosition = CGPointMake(0,0);//CGRectGetMidX(self.scene.frame), CGRectGetMidY(self.scene.frame));
        
    }
    
    return self;
}


-(void) drawLargeBucket{
    
    CGFloat bucketHeight = 10;
    
    if(self.numberOfBucket==1){
        //CGFloat bucketWidth = 400.0;
        
        if(self.bucketPosition.x==0 && self.bucketPosition.y==0){
            self.bucketPosition = CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMaxY(self.scene.frame)*0.45);
        }

        
        CGSize bucketSize= CGSizeMake(self.bucketWidth, bucketHeight);
        
        [self drawBucketAtPoint:self.bucketPosition size:bucketSize];
        
    }else{
        /*CGFloat bucketWidthRange=(CGRectGetMaxY(self.scene.frame)/self.numberOfBucket);
        CGFloat bucketWidth = (bucketWidthRange*0.6);
        
        for(u_int8_t i=1;i<=self.numberOfBucket;i++){
            
        }*/
        
        
    }
    
}

-(void) drawSmallBucket{
    
}

-(void) setBucketSectionPhysicsBody:(SKSpriteNode*) section{
    
    section.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:section.size];
    section.physicsBody.mass=BucketSectionMass;
    section.physicsBody.affectedByGravity=YES;
    section.physicsBody.allowsRotation=TRUE;
    section.physicsBody.categoryBitMask=BucketCategory;
    //firstRopeSectionNode.zPosition=100.0;
    
    
}

-(void) drawBucketAtPoint:(CGPoint) point size:(CGSize) size{
   
    CGFloat boundryThickness = 10.0;
    CGSize bucketFloorSize = CGSizeMake(size.width, boundryThickness);
    CGSize bucketWallSize= CGSizeMake(boundryThickness, size.height);
    SKColor* bucketColor = SKColor.blueColor;
    
    SKSpriteNode* bucketFloor=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketFloorSize];
    
    bucketFloor.position=point;
    //CGPointMake(CGRectGetMaxX(self.frame)+ (bucketFloor.size.width/2)-(bucketFloor.size.width), CGRectGetMinY(self.frame));
    //[self addChild:bucketFloor];
    
    //bucketFloor.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketFloor.size];
    //bucketFloor.physicsBody.dynamic=NO;
    
    SKSpriteNode* bucketWallA=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketWallSize];
    
    bucketWallA.position= CGPointMake(bucketFloor.position.x-bucketFloor.size.width/2+bucketWallA.size.width/2,bucketFloor.position.y+bucketWallA.size.height/2);//+bucketFloor.size.height);
    //bucketWallA.zPosition=100;
    
    [self.scene addChild:bucketWallA];
    
    bucketWallA.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketWallA.size];
    bucketWallA.physicsBody.dynamic=NO;
    
    
    ////rope first section
    
    
    
    SKSpriteNode *firstRopeSectionNode = [SKSpriteNode spriteNodeWithImageNamed:HorizontalRopeSectionFile];
    //[craneComponents addObject:firstRopeSectionNode];
    firstRopeSectionNode.position=CGPointMake(bucketWallA.position.x+firstRopeSectionNode.size.width/2.0, CGRectGetMinY(bucketWallA.frame));
    [self setBucketSectionPhysicsBody:firstRopeSectionNode];
    
    //Anchor
    
    CGPoint firstAnchorPoint=CGPointMake(CGRectGetMidX(bucketWallA.frame),(CGRectGetMinY(bucketWallA.frame)));
    
    SKPhysicsJointPin *firstJointPin=[SKPhysicsJointPin
                                      jointWithBodyA:bucketWallA.physicsBody
                                      bodyB:firstRopeSectionNode.physicsBody
                                      anchor:firstAnchorPoint]  ;
    [self.scene addChild:firstRopeSectionNode];
    [self.scene.physicsWorld addJoint:firstJointPin];
    
    //SKPhysicsJointSpring *firstJointPin=[SKPhysicsJointSpring
    //                            jointWithBodyA:bucketWallA.physicsBody
    //                          bodyB:firstRopeSectionNode.physicsBody
    //                        anchorA:firstAnchorPoint
    //                             anchorB:CGPointMake(firstRopeSectionNode.position.x,CGRectGetMidY(firstRopeSectionNode.frame))]  ;
    
    
    //other sections
    
    int ropeSectionsCount = size.width/firstRopeSectionNode.size.width;
    SKSpriteNode *previousRopeSection=firstRopeSectionNode;
    SKSpriteNode *currentRopeSection;
    
    for(int section=1; section<(ropeSectionsCount); section++){
        
        currentRopeSection = [SKSpriteNode spriteNodeWithImageNamed:HorizontalRopeSectionFile];
        //[craneComponents addObject:currentRopeSection];
        
        currentRopeSection.position = CGPointMake(CGRectGetMaxX(previousRopeSection.frame)+currentRopeSection.size.width/2.0,previousRopeSection.position.y);//CGRectGetMinY(previousRopeSection.frame)-(currentRopeSection.size.height));
        [self setBucketSectionPhysicsBody:currentRopeSection];
        
        //currentRopeSection.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:currentRopeSection.size];
        //currentRopeSection.physicsBody.mass=BucketSectionMass;
        //currentRopeSection.physicsBody.allowsRotation=TRUE;
        //currentRopeSection.zPosition=100.0;
        
        SKPhysicsJointPin *jointPin=[SKPhysicsJointPin
                                     jointWithBodyA:previousRopeSection.physicsBody
                                     bodyB:currentRopeSection.physicsBody
                                     anchor:CGPointMake(CGRectGetMaxX(previousRopeSection.frame),(CGRectGetMidY(previousRopeSection.frame)))];
        
        
        /*SKPhysicsJointSpring *jointPin=[SKPhysicsJointSpring jointWithBodyA:
         previousRopeSection.physicsBody
         bodyB:currentRopeSection.physicsBody
         anchorA:CGPointMake(CGRectGetMaxX(previousRopeSection.frame),(CGRectGetMidY(previousRopeSection.frame)))
         anchorB:CGPointMake(CGRectGetMinX(currentRopeSection.frame), CGRectGetMidY(currentRopeSection.frame))];*/
        
        
        
        [self.scene addChild:currentRopeSection];
        [self.scene.physicsWorld addJoint:jointPin];
        previousRopeSection=currentRopeSection;
    }
    
    //attach wrecking ball
    
    SKSpriteNode* bucketWallB=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketWallSize];
    
    bucketWallB.position= CGPointMake(CGRectGetMaxX(previousRopeSection.frame),previousRopeSection.position.y+bucketWallB.size.width/2.0);
    
    //CGPointMake(CGRectGetMaxX(bucketFloor.frame)-bucketWallB.size.width+bucketWallB.size.width/2, bucketFloor.position.y+bucketWallB.size.height/2);//+bucketFloor.size.height);
    //bucketWallA.zPosition=100;

    
    bucketWallB.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketWallB.size];
    bucketWallB.physicsBody.dynamic=NO;
    
    
    
    
    //wreckingBallShapeNode.position= CGPointMake(previousRopeSection.position.x,CGRectGetMinY(previousRopeSection.frame));
    
    //wreckingBallShapeNode.physicsBody=[SKPhysicsBody bodyWithCircleOfRadius:(wreckingBallShapeNode.size.width/2.0)];
    //wreckingBallShapeNode.physicsBody.allowsRotation=TRUE;
    
    //wreckingBallShapeNode.physicsBody.dynamic=TRUE;
    //wreckingBallShapeNode.physicsBody.affectedByGravity=TRUE;
    
    //wreckingBallShapeNode.physicsBody.mass=1;
    
    
    
    SKPhysicsJointPin* lastJointPin=[SKPhysicsJointPin jointWithBodyA:previousRopeSection.physicsBody
                                                                bodyB:bucketWallB.physicsBody
                                                               anchor:CGPointMake(CGRectGetMaxX(previousRopeSection.frame),(CGRectGetMidY(previousRopeSection.frame)))];
    [self.scene addChild:bucketWallB];
    [self.scene.physicsWorld addJoint:lastJointPin];
    
    
    
    
    
    
    //////
    
    
    
    
    
    
    
}





@end
