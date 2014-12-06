//
//  Rope.m
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "Rope.h"
#import "SharedResources.h"

@interface Rope(){
    SKSpriteNode* ropeHangerNode;
    SKSpriteNode* wreckingBallCylinder;
    NSMutableArray* ropeSectionsArray;
    int jiggleDirection;
    int jiggleImpulse;
    
    
    NSMutableArray *wreckingBallAnimationFrames;
    
}

@end
@implementation Rope

-(id) init{
    if(self=[super init]){
        self.ropeLength=6;
        self.impulseDirection=SWING_RIGHT;
        self.ropePosition=CGPointMake(CGRectGetMidX(self.scene.frame),CGRectGetMidY(self.scene.frame));
        ropeSectionsArray=[NSMutableArray array];
        jiggleDirection=-1;
        jiggleImpulse=250;
        self.ropeName=[NSString stringWithFormat:@"Rope"];
        
        
        
        wreckingBallAnimationFrames=[NSMutableArray array];
        
        [wreckingBallAnimationFrames addObject:[SKTexture textureWithImageNamed:WreckingBallImageFile]];
        [wreckingBallAnimationFrames addObject:[SKTexture textureWithImageNamed:WreckingBallImageFile2]];
        [wreckingBallAnimationFrames addObject:[SKTexture textureWithImageNamed:WreckingBallImageFile3]];
        
        
        
    }
    return self;
}

-(u_int8_t) getRopeWidth{
    
    if(wreckingBallCylinder){
        return wreckingBallCylinder.size.width;
    }if(ropeSectionsArray.count>0){
       return ((SKSpriteNode*)[ropeSectionsArray objectAtIndex:0]).size.width;
    }if (ropeHangerNode) {
        return ropeHangerNode.size.width;
    }
    
    return 0;
    
}
-(void) drawRopeWithWreckingBall{
    
    [self drawRopeAtPoint:self.ropePosition ofSize:self.ropeLength withWreckingBall:YES];
    
}

-(void) drawRope{
    [self drawRopeAtPoint:self.ropePosition ofSize:self.ropeLength withWreckingBall:NO];
}

-(void) drawRopeAtPoint:(CGPoint) point ofSize:(int) size withWreckingBall:(BOOL) attachWreckingBall{
    
    ropeHangerNode = [SKSpriteNode spriteNodeWithImageNamed:@"ropehanger.png"];
    //[craneComponents addObject:ropeHangerNode];
    
    ropeHangerNode.name=@"ropehanger";
    ropeHangerNode.position=point;
    [self.scene addChild:ropeHangerNode];
    
    ropeHangerNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:ropeHangerNode.size];
    ropeHangerNode.physicsBody.dynamic=FALSE;
    
    
    SKSpriteNode *firstRopeSectionNode = [SKSpriteNode spriteNodeWithImageNamed:VerticalRopeSectionFile];
    firstRopeSectionNode.name=self.ropeName;
    [ropeSectionsArray addObject:firstRopeSectionNode];
    
    firstRopeSectionNode.position=CGPointMake(CGRectGetMidX(ropeHangerNode.frame), CGRectGetMinY(ropeHangerNode.frame));
    
    firstRopeSectionNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:firstRopeSectionNode.size];
    firstRopeSectionNode.physicsBody.mass=RopeSectionMass;
    firstRopeSectionNode.physicsBody.affectedByGravity=YES;
    firstRopeSectionNode.physicsBody.allowsRotation=TRUE;
    //firstRopeSectionNode.zPosition=100.0;
    
    CGPoint firstAnchorPoint=CGPointMake(CGRectGetMidX(ropeHangerNode.frame),(CGRectGetMinY(ropeHangerNode.frame)));
    
    SKPhysicsJointPin *firstJointPin=[SKPhysicsJointPin
                                      jointWithBodyA:ropeHangerNode.physicsBody
                                      bodyB:firstRopeSectionNode.physicsBody
                                      anchor:firstAnchorPoint]  ;
    
    
    [self.scene addChild:firstRopeSectionNode];
    [self.scene.physicsWorld addJoint:firstJointPin];
    
    SKSpriteNode *previousRopeSection=firstRopeSectionNode;
    SKSpriteNode *currentRopeSection;
    
    for(int section=1; section<(size); section++){
        
        currentRopeSection = [SKSpriteNode spriteNodeWithImageNamed:VerticalRopeSectionFile];
        [ropeSectionsArray addObject:currentRopeSection];
        currentRopeSection.name=self.ropeName;
        
        currentRopeSection.position = CGPointMake(previousRopeSection.position.x,CGRectGetMinY(previousRopeSection.frame)-currentRopeSection.size.height/2.0);
        
        currentRopeSection.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:currentRopeSection.size];
        currentRopeSection.physicsBody.mass=RopeSectionMass;
        currentRopeSection.physicsBody.allowsRotation=TRUE;
        //currentRopeSection.zPosition=100.0;
        
        SKPhysicsJointPin *jointPin=[SKPhysicsJointPin jointWithBodyA:
                                     previousRopeSection.physicsBody
                                                                bodyB:currentRopeSection.physicsBody
                                                               anchor:CGPointMake(CGRectGetMidX(previousRopeSection.frame),(CGRectGetMinY(previousRopeSection.frame)))]  ;
        
        
        [self.scene addChild:currentRopeSection];
        [self.scene.physicsWorld addJoint:jointPin];
        previousRopeSection=currentRopeSection;
    }
    
    if(attachWreckingBall){
        //attach wrecking ball
        wreckingBallCylinder=[SKSpriteNode spriteNodeWithImageNamed:WreckingBallImageFile];
        
        wreckingBallCylinder.position= CGPointMake(previousRopeSection.position.x,CGRectGetMinY(previousRopeSection.frame)-wreckingBallCylinder.size.height/2.0);
        
        wreckingBallCylinder.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:wreckingBallCylinder.size];
        wreckingBallCylinder.physicsBody.categoryBitMask=WreckingBallCategory;
        wreckingBallCylinder.physicsBody.collisionBitMask=BallCategory;
        wreckingBallCylinder.physicsBody.contactTestBitMask=BallCategory;
        //CircleOfRadius:(wreckingBallShapeNode.size.width/2.0)];
        wreckingBallCylinder.physicsBody.allowsRotation=TRUE;
        wreckingBallCylinder.name=self.ropeName;
        
        wreckingBallCylinder.physicsBody.dynamic=TRUE;
        //wreckingBallCylinder.physicsBody.affectedByGravity=TRUE;
        wreckingBallCylinder.physicsBody.mass=WreckingBallMass;
        
        //wreckingBallShapeNode.physicsBody.mass=WreckingBallMass;
        
        
        
        SKPhysicsJointPin* lastJointPin=[SKPhysicsJointPin jointWithBodyA:previousRopeSection.physicsBody
                                                                    bodyB:wreckingBallCylinder.physicsBody
                                                                   anchor:CGPointMake(CGRectGetMidX(previousRopeSection.frame),(CGRectGetMaxY(previousRopeSection.frame)))];
        [self.scene addChild:wreckingBallCylinder];
        [self.scene.physicsWorld addJoint:lastJointPin];
        
        
        [wreckingBallCylinder runAction:[SKAction repeatActionForever:
                         [SKAction animateWithTextures:wreckingBallAnimationFrames
                                          timePerFrame:3
                                                resize:NO
                                               restore:YES]] withKey:@"wrecking_ball_frames"];
        
        /*SKAction * applyImpulseAction = [SKAction runBlock:^{
         [wreckingBallShapeNode.physicsBody applyImpulse:CGVectorMake(500.0,0.0)];
         
         NSLog(@"ApplyImpulse BlockAction");
         
         }];*/
        //applyImpulseAction.speed=0.1;
        
        //applyImpulseAction.duration=10000;
        
        //SKAction* applyImpulse2 =[SKAction repeatActionForever:applyImpulseAction ];
        
        /*SKAction* applyImpulse =[SKAction customActionWithDuration:0.000001 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
         if(!(elapsedTime>0)){
         [node.physicsBody applyImpulse:CGVectorMake(500.0,0.0)];
         
         NSLog(@"ApplyImpulse Action:%f",elapsedTime);
         }
         
         }];*/
        
        //[wreckingBallShapeNode runAction:applyImpulseAction ];
    }
    
    
}

-(void) jiggle{
    if(ropeSectionsArray){
        if(ropeSectionsArray.count>0){
            SKSpriteNode* lastRopeSection = [ropeSectionsArray objectAtIndex:ropeSectionsArray.count-1];
            [lastRopeSection.physicsBody applyImpulse:CGVectorMake(jiggleDirection*jiggleImpulse, jiggleDirection*jiggleImpulse)];
            
            jiggleDirection=jiggleDirection*-1;//reverse it next time
            //sleep(6);
        }
    }
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   // NSLog(@"Swing Wreckingball");
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.scene];
    NSArray* nodesAtTouch= [self.scene nodesAtPoint:touchPoint];
    
    for(SKNode* node in nodesAtTouch){
        
        //CGFloat xImpulseVector= (node.physicsBody.mass)*1000.0;
        //CGFloat yImpulseVector= (node.physicsBody.mass)*2000.0;
        
        CGFloat cylinderXImpulseFactor = (wreckingBallCylinder.physicsBody.mass)*1000;
        CGFloat cylinderYImpulseFactor= (wreckingBallCylinder.physicsBody.mass)*1000;
        
        if(node.physicsBody.categoryBitMask==BallCategory){
            
         if(wreckingBallCylinder){
             
             //int impulseDirection=1;
             
             int impulseDirectionX = 1;
            
             if(node.position.x-self.ropePosition.x<0){
                 impulseDirectionX=-1;
                 
             }else{
                 impulseDirectionX=1;
             }
            
           /* if(node.position.x>CGRectGetMidX(self.scene.frame)){
                
                if(self.ropePosition.x>CGRectGetMidX(self.scene.frame)){
                    impulseDirection=-1;
                }if(self.ropePosition.x==CGRectGetMidX(self.scene.frame)){
                    impulseDirection=1;
                }
                
                                   //                    NSLog(@"cylinder moved");
                
                
            }else{
                

                //[wreckingBallCylinder.physicsBody applyImpulse:CGVectorMake(-1.0*cylinderXImpulseFactor,cylinderYImpulseFactor)];
                //                    NSLog(@"cylinder moved");
                
            }*/
             
             [wreckingBallCylinder.physicsBody applyImpulse:CGVectorMake(impulseDirectionX*cylinderXImpulseFactor,cylinderYImpulseFactor)];

         }else{
             
             [self jiggle];
         }
        
        
        
        }
        
        
        
        //[node.physicsBody applyAngularImpulse:(10.0) ];// CGVectorMake(1000,10000)];
    }
    
}

/*-(void) didBeginContact:(SKPhysicsContact *)contact{
    if ((contact.bodyA.categoryBitMask==WreckingBallCategory &&
        contact.bodyB.categoryBitMask==BallCategory) ||
        (contact.bodyA.categoryBitMask==BallCategory &&
        contact.bodyB.categoryBitMask==WreckingBallCategory)) {
        
        if(contact.collisionImpulse>(contact.bodyA.mass*100.0)){
            
           // [self runAction:[SKAction playSoundFileNamed:soundBallsCollisionFile waitForCompletion:NO]];
        }
    

        
    }
}*/



@end
