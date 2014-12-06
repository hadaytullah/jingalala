////
////  MainScene.m
////  WreckingBall
////
////  Created by Hadaytullah on 18/03/14.
////  Copyright (c) 2014 Hadaytullah. All rights reserved.
////
//
//#import "MainScene.h"
//#import "SharedResources.h"
//#import "Rope.h"
//#import "Bucket.h"
//#import "Ball.h"
//#import "SingleWreckingBall.h"
//
//@interface MainScene(){
//    //SKSpriteNode* ropeHangerNode;
//    //SKSpriteNode* wreckingBallShapeNode;
//    //SKSpriteNode* edgeNode;
//    
//    //NSMutableArray* craneComponents;
//    //NSMutableArray* structureComponents;
//    
//    NSMutableArray* ballsArray;
//    
//    //BOOL touchBeginAtRopeHanger;
//    //BOOL moveTouchHappend;
//    
//    //CGFloat verticalWidth;//=10.0;
//    //CGFloat verticalHeight;//=20.0;
//    
//    //CGFloat horizontalWidth;//=verticalWidth*3.0;//30.0;
//    //CGFloat horizontalHeight;//=verticalWidth;
//    
//    //SKSpriteNode* bucketFloor;
//    //SKSpriteNode* bucketWallA;
//    //SKSpriteNode* bucketWallB;
//    
//    int currentGameLevel;
//    SKSpriteNode* wreckingBallCylinder;
//   
//    //NSMutableString* verticalBlockImageFile;
//    //NSMutableString* horizontalBlockImageFile;
//    
//    
//    SingleWreckingBall* singleWreckingBallLevel;
//    
//}
//
//@end
//
//@implementation MainScene
//
//-(id) initWithSize:(CGSize)size{
//    self=[super initWithSize:size];
//    
//    if(self){
//        //[self setBackgroundColor:SKColor.whiteColor];
//        
//        SKSpriteNode *backGroundImageNode = [SKSpriteNode spriteNodeWithImageNamed:@"background.png"];
//        [self addChild:backGroundImageNode];
//        backGroundImageNode.position=CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//        
//        
//        self.physicsBody=[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
//        self.physicsWorld.gravity=CGVectorMake(-0.1, -9.8);//earth's gravity
//        
//     
//        
//        //touchBeginAtRopeHanger=FALSE;
//        //moveTouchHappend=FALSE;
//        //craneComponents=[NSMutableArray array];
//        //structureComponents=[NSMutableArray array];
//        ballsArray=[NSMutableArray array];
//        
//        //verticalWidth=10.0;
//        //verticalHeight=20.0;
//        
//        //horizontalWidth=verticalWidth*3.0;//30.0;
//        //horizontalHeight=verticalWidth;
//        
//        //verticalBlockImageFile=[NSMutableString stringWithString: @"vertical_block_green"];
//        //horizontalBlockImageFile=[NSMutableString stringWithString:@"horizontal_block"];
//        
//        
//        
//        //[self drawScene:size];
//        currentGameLevel=1;
//        
//        //self.physicsWorld.contactDelegate=self;
//        
//        singleWreckingBallLevel=[[SingleWreckingBall alloc] init];
//        [self addChild:singleWreckingBallLevel];
//        [singleWreckingBallLevel drawLevel];
//        
//        //[self drawSceneLevel4];
//        
//    }
//    
//    return self;
//}
//
//
//-(void) drawSceneLevel1{
//    CGFloat bucketWidth = 400.0;
//    CGFloat bucketHeight = 10;
//    
//    CGPoint bucketPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//    int numberOfBalls = 10;
//    CGSize bucketSize= CGSizeMake(bucketWidth, bucketHeight);
//    
//    [self drawBucketAtPoint2:bucketPosition size:bucketSize];
//    [self drawBalls:numberOfBalls];
//}
//
//-(void) drawSceneLevel2{
//    CGFloat bucketWidth = 400.0;
//    CGFloat bucketHeight = 10;
//    
//    CGPoint bucketPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//    int numberOfBalls = 10;
//    CGSize bucketSize= CGSizeMake(bucketWidth, bucketHeight);
//    
//    [self drawBucketAtPoint2:bucketPosition size:bucketSize];
//    [self drawBalls:numberOfBalls];
//    [self drawRopeAtPoint:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+self.size.width/4)    ofSize:10 withWreckingBall:NO];
//}
//
//-(void) drawSceneLevel3{
//    CGFloat bucketWidth = 400.0;
//    CGFloat bucketHeight = 10;
//    
//    CGPoint bucketPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//    int numberOfBalls = 10;
//    CGSize bucketSize= CGSizeMake(bucketWidth, bucketHeight);
//    
//    [self drawBucketAtPoint2:bucketPosition size:bucketSize];
//    [self drawBalls:numberOfBalls];
//
//    
//    int ropeSize=10;
//    
//    CGPoint ropeAtCenterPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+self.size.width/4);
//    [self drawRopeAtPoint:ropeAtCenterPosition  ofSize:ropeSize withWreckingBall:NO];
//
//    
//    CGPoint ropeTwoPosition = CGPointMake(CGRectGetMidX(self.frame)/2, ropeAtCenterPosition.y);
//    [self drawRopeAtPoint:ropeTwoPosition  ofSize:ropeSize withWreckingBall:NO];
//
//    CGPoint ropeThreePosition = CGPointMake(CGRectGetMidX(self.frame)+CGRectGetMidX(self.frame)/2.0, ropeAtCenterPosition.y);
//    [self drawRopeAtPoint:ropeThreePosition  ofSize:ropeSize  withWreckingBall:NO];
//
//    //CGPoint ropeFourPosition = CGPointMake(CGRectGetMidX(self.frame), ropeAtCenterPosition.y);
//    //[self drawRopeAtPoint:ropeFourPosition];
//
//    
//    //[self drawRopeAtPoint:ropeOnePosition];
//}
//
///*-(void) drawSceneLevel4{
//    currentGameLevel=4;
//    //CGFloat bucketWidth = 400.0;
//    //CGFloat bucketHeight = 10;
//    
//    //CGPoint bucketPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//    //CGSize bucketSize= CGSizeMake(bucketWidth, bucketHeight);
//    
//    Bucket* bucket=[[Bucket alloc]init];
//    [self addChild:bucket];
//    [bucket drawLargeBucket];//drawBucketAtPoint2:bucketPosition size:bucketSize];
//    
//    
//    
//    int numberOfBalls = 10;
//    Ball* ball=[[Ball alloc]init];
//    [self addChild:ball];
//    ball.numberOfBalls=numberOfBalls;
//    [ball drawBalls];
//    
//    //[self drawBalls:numberOfBalls];
//    
//    
//    
//    CGPoint ropeAtCenterPosition = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+self.size.width/4);
//    
//    Rope* rope=[[Rope alloc]init];
//    [self addChild:rope];
//    
//    rope.ropePosition=ropeAtCenterPosition;
//    
//    [rope drawRopeWithWreckingBall];
//    //[rope drawRopeAtPoint:ropeAtCenterPosition ofSize:12 withWreckingBall:YES];
//    
//    
//    //CGPoint ropeTwoPosition = CGPointMake(CGRectGetMidX(self.frame)/2, ropeAtCenterPosition.y);
//    //[self drawRopeAtPoint:ropeTwoPosition withWreckingBall:NO];
//    
//    //CGPoint ropeThreePosition = CGPointMake(CGRectGetMidX(self.frame)+CGRectGetMidX(self.frame)/2.0, ropeAtCenterPosition.y);
//    //[self drawRopeAtPoint:ropeThreePosition withWreckingBall:NO];
// 
//    //CGPoint ropeFourPosition = CGPointMake(CGRectGetMidX(self.frame), ropeAtCenterPosition.y);
//    //[self drawRopeAtPoint:ropeFourPosition];
//    
//    
//    //[self drawRopeAtPoint:ropeOnePosition];
//}*/
//
//-(void) drawRopeAtPoint:(CGPoint) point ofSize:(int) size withWreckingBall:(BOOL) attachWreckingBall{
//    
//    SKSpriteNode* ropeHangerNode = [SKSpriteNode spriteNodeWithImageNamed:@"ropehanger.png"];
//    //[craneComponents addObject:ropeHangerNode];
//    
//    ropeHangerNode.name=@"ropehanger";
//    ropeHangerNode.position=point;
//    [self addChild:ropeHangerNode];
//    
//    ropeHangerNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:ropeHangerNode.size];
//    ropeHangerNode.physicsBody.dynamic=FALSE;
//   
//    
//    SKSpriteNode *firstRopeSectionNode = [SKSpriteNode spriteNodeWithImageNamed:VerticalRopeSectionFile];
//    //[craneComponents addObject:firstRopeSectionNode];
//    
//    firstRopeSectionNode.position=CGPointMake(CGRectGetMidX(ropeHangerNode.frame), CGRectGetMinY(ropeHangerNode.frame));
//    
//    firstRopeSectionNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:firstRopeSectionNode.size];
//    firstRopeSectionNode.physicsBody.mass=RopeSectionMass;
//    firstRopeSectionNode.physicsBody.affectedByGravity=YES;
//    //firstRopeSectionNode.physicsBody.allowsRotation=TRUE;
//    //firstRopeSectionNode.zPosition=100.0;
//    
//    CGPoint firstAnchorPoint=CGPointMake(CGRectGetMidX(ropeHangerNode.frame),(CGRectGetMinY(ropeHangerNode.frame)));
//    
//    SKPhysicsJointPin *firstJointPin=[SKPhysicsJointPin
//                                      jointWithBodyA:ropeHangerNode.physicsBody
//                                      bodyB:firstRopeSectionNode.physicsBody
//                                      anchor:firstAnchorPoint]  ;
//    
//    
//    [self addChild:firstRopeSectionNode];
//    [self.physicsWorld addJoint:firstJointPin];
//    
//    SKSpriteNode *previousRopeSection=firstRopeSectionNode;
//    SKSpriteNode *currentRopeSection;
//    
//    for(int section=1; section<(size); section++){
//        
//        currentRopeSection = [SKSpriteNode spriteNodeWithImageNamed:VerticalRopeSectionFile];
//        //[craneComponents addObject:currentRopeSection];
//        
//        currentRopeSection.position = CGPointMake(previousRopeSection.position.x,CGRectGetMinY(previousRopeSection.frame)-currentRopeSection.size.height/2.0);
//        
//        currentRopeSection.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:currentRopeSection.size];
//        currentRopeSection.physicsBody.mass=RopeSectionMass;
//        currentRopeSection.physicsBody.allowsRotation=TRUE;
//        //currentRopeSection.zPosition=100.0;
//        
//        SKPhysicsJointPin *jointPin=[SKPhysicsJointPin jointWithBodyA:
//                                     previousRopeSection.physicsBody
//                                                                bodyB:currentRopeSection.physicsBody
//                                                               anchor:CGPointMake(CGRectGetMidX(previousRopeSection.frame),(CGRectGetMinY(previousRopeSection.frame)))]  ;
//        
//        
//        [self addChild:currentRopeSection];
//        [self.physicsWorld addJoint:jointPin];
//        previousRopeSection=currentRopeSection;
//    }
//    
//    if(attachWreckingBall){
//        //attach wrecking ball
//        wreckingBallCylinder=[SKSpriteNode spriteNodeWithImageNamed:WreckingBallImageFile];
//        
//        wreckingBallCylinder.position= CGPointMake(previousRopeSection.position.x,CGRectGetMinY(previousRopeSection.frame)-wreckingBallCylinder.size.height/2.0);
//        
//        wreckingBallCylinder.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:wreckingBallCylinder.size];
//        //CircleOfRadius:(wreckingBallShapeNode.size.width/2.0)];
//        wreckingBallCylinder.physicsBody.allowsRotation=TRUE;
//        
//        wreckingBallCylinder.physicsBody.dynamic=TRUE;
//        wreckingBallCylinder.physicsBody.affectedByGravity=TRUE;
//        
//        //wreckingBallShapeNode.physicsBody.mass=WreckingBallMass;
//        
//        
//        
//        SKPhysicsJointPin* lastJointPin=[SKPhysicsJointPin jointWithBodyA:previousRopeSection.physicsBody
//                                                                    bodyB:wreckingBallCylinder.physicsBody
//                                                                   anchor:CGPointMake(CGRectGetMidX(previousRopeSection.frame),(CGRectGetMaxY(previousRopeSection.frame)))];
//        [self addChild:wreckingBallCylinder];
//        [self.physicsWorld addJoint:lastJointPin];
//        
//        
//       /*SKAction * applyImpulseAction = [SKAction runBlock:^{
//           [wreckingBallShapeNode.physicsBody applyImpulse:CGVectorMake(500.0,0.0)];
//            
//            NSLog(@"ApplyImpulse BlockAction");
//            
//        }];*/
//        //applyImpulseAction.speed=0.1;
//        
//        //applyImpulseAction.duration=10000;
//        
//        //SKAction* applyImpulse2 =[SKAction repeatActionForever:applyImpulseAction ];
//        
//        /*SKAction* applyImpulse =[SKAction customActionWithDuration:0.000001 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
//            if(!(elapsedTime>0)){
//                [node.physicsBody applyImpulse:CGVectorMake(500.0,0.0)];
//            
//            NSLog(@"ApplyImpulse Action:%f",elapsedTime);
//            }
//        
//        }];*/
//        
//        //[wreckingBallShapeNode runAction:applyImpulseAction ];
//    }
//    
//    
//}
//
//
//-(void) drawScene:(CGSize) size{
//    
//    //[self drawBucketAtPoint:CGPointMake(100, 100) size:100];
//    [self drawBalls:10];
//    //[self drawStructure:2];
//    //[self drawBucket];
//    //[self drawCraneAtPoint:CGPointMake(CGRectGetMinX(self.scene.frame)+20, CGRectGetMidY(self.scene.frame)-35)];
//    
//    
//}
//
//-(void) drawBucketAtPoint2:(CGPoint) point size:(CGSize) size{
//    CGFloat boundryThickness = 10.0;
//    CGSize bucketFloorSize = CGSizeMake(size.width, boundryThickness);
//    CGSize bucketWallSize= CGSizeMake(boundryThickness, size.height);
//    SKColor* bucketColor = SKColor.blueColor;
//    
//    SKSpriteNode* bucketFloor=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketFloorSize];
//    
//    bucketFloor.position=point;
//    //CGPointMake(CGRectGetMaxX(self.frame)+ (bucketFloor.size.width/2)-(bucketFloor.size.width), CGRectGetMinY(self.frame));
//    //[self addChild:bucketFloor];
//    
//    //bucketFloor.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketFloor.size];
//    //bucketFloor.physicsBody.dynamic=NO;
//    
//    SKSpriteNode* bucketWallA=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketWallSize];
//    
//    bucketWallA.position= CGPointMake(bucketFloor.position.x-bucketFloor.size.width/2+bucketWallA.size.width/2,bucketFloor.position.y+bucketWallA.size.height/2);//+bucketFloor.size.height);
//    //bucketWallA.zPosition=100;
//    
//    [self addChild:bucketWallA];
//    
//    bucketWallA.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketWallA.size];
//    bucketWallA.physicsBody.dynamic=NO;
//    
//    
//    ////rope
//    
//    
//        
//        SKSpriteNode *firstRopeSectionNode = [SKSpriteNode spriteNodeWithImageNamed:HorizontalRopeSectionFile];
//        int ropeSectionsCount = size.width/firstRopeSectionNode.size.width;
//        //[craneComponents addObject:firstRopeSectionNode];
//        
//        firstRopeSectionNode.position=CGPointMake(bucketWallA.position.x+firstRopeSectionNode.size.width/2.0, CGRectGetMinY(bucketWallA.frame));
//        
//        firstRopeSectionNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:firstRopeSectionNode.size];
//        firstRopeSectionNode.physicsBody.mass=BucketSectionMass;
//        firstRopeSectionNode.physicsBody.affectedByGravity=YES;
//        firstRopeSectionNode.physicsBody.allowsRotation=TRUE;
//        //firstRopeSectionNode.zPosition=100.0;
//        
//        CGPoint firstAnchorPoint=CGPointMake(CGRectGetMidX(bucketWallA.frame),(CGRectGetMinY(bucketWallA.frame)));
//        
//        SKPhysicsJointPin *firstJointPin=[SKPhysicsJointPin
//                                          jointWithBodyA:bucketWallA.physicsBody
//                                          bodyB:firstRopeSectionNode.physicsBody
//                                          anchor:firstAnchorPoint]  ;
//        //SKPhysicsJointSpring *firstJointPin=[SKPhysicsJointSpring
//          //                            jointWithBodyA:bucketWallA.physicsBody
//            //                          bodyB:firstRopeSectionNode.physicsBody
//              //                        anchorA:firstAnchorPoint
//                //                             anchorB:CGPointMake(firstRopeSectionNode.position.x,CGRectGetMidY(firstRopeSectionNode.frame))]  ;
//    
//    
//        [self addChild:firstRopeSectionNode];
//        [self.physicsWorld addJoint:firstJointPin];
//        
//        SKSpriteNode *previousRopeSection=firstRopeSectionNode;
//        SKSpriteNode *currentRopeSection;
//        
//        for(int section=1; section<(ropeSectionsCount); section++){
//            
//            currentRopeSection = [SKSpriteNode spriteNodeWithImageNamed:HorizontalRopeSectionFile];
//            //[craneComponents addObject:currentRopeSection];
//            
//            currentRopeSection.position = CGPointMake(CGRectGetMaxX(previousRopeSection.frame)+currentRopeSection.size.width/2.0,previousRopeSection.position.y);//CGRectGetMinY(previousRopeSection.frame)-(currentRopeSection.size.height));
//            
//            currentRopeSection.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:currentRopeSection.size];
//            //currentRopeSection.physicsBody.mass=BucketSectionMass;
//            currentRopeSection.physicsBody.allowsRotation=TRUE;
//            //currentRopeSection.zPosition=100.0;
//            SKPhysicsJointPin *jointPin=[SKPhysicsJointPin
//                    jointWithBodyA:previousRopeSection.physicsBody
//                    bodyB:currentRopeSection.physicsBody
//                    anchor:CGPointMake(CGRectGetMaxX(previousRopeSection.frame),(CGRectGetMidY(previousRopeSection.frame)))];
//            
//            
//            /*SKPhysicsJointSpring *jointPin=[SKPhysicsJointSpring jointWithBodyA:
//                previousRopeSection.physicsBody
//                bodyB:currentRopeSection.physicsBody
//                anchorA:CGPointMake(CGRectGetMaxX(previousRopeSection.frame),(CGRectGetMidY(previousRopeSection.frame)))
//                anchorB:CGPointMake(CGRectGetMinX(currentRopeSection.frame), CGRectGetMidY(currentRopeSection.frame))];*/
//                                            
//            
//            
//            [self addChild:currentRopeSection];
//            [self.physicsWorld addJoint:jointPin];
//            previousRopeSection=currentRopeSection;
//        }
//        
//        //attach wrecking ball
//    
//    SKSpriteNode* bucketWallB=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketWallSize];
//    
//    bucketWallB.position= CGPointMake(CGRectGetMaxX(previousRopeSection.frame),previousRopeSection.position.y+bucketWallB.size.width/2.0);
//    
//    //CGPointMake(CGRectGetMaxX(bucketFloor.frame)-bucketWallB.size.width+bucketWallB.size.width/2, bucketFloor.position.y+bucketWallB.size.height/2);//+bucketFloor.size.height);
//    //bucketWallA.zPosition=100;
//    [self addChild:bucketWallB];
//    
//    bucketWallB.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketWallB.size];
//    bucketWallB.physicsBody.dynamic=NO;
//    
//    
//    
//    
//    //wreckingBallShapeNode.position= CGPointMake(previousRopeSection.position.x,CGRectGetMinY(previousRopeSection.frame));
//        
//        //wreckingBallShapeNode.physicsBody=[SKPhysicsBody bodyWithCircleOfRadius:(wreckingBallShapeNode.size.width/2.0)];
//        //wreckingBallShapeNode.physicsBody.allowsRotation=TRUE;
//        
//        //wreckingBallShapeNode.physicsBody.dynamic=TRUE;
//        //wreckingBallShapeNode.physicsBody.affectedByGravity=TRUE;
//        
//        //wreckingBallShapeNode.physicsBody.mass=1;
//        
//        
//        
//        SKPhysicsJointPin* lastJointPin=[SKPhysicsJointPin jointWithBodyA:previousRopeSection.physicsBody
//                                                                    bodyB:bucketWallB.physicsBody
//                                                                   anchor:CGPointMake(CGRectGetMaxX(previousRopeSection.frame),(CGRectGetMidY(previousRopeSection.frame)))];
//        
//        [self.physicsWorld addJoint:lastJointPin];
//
//    
//    
//    
//    
//    
//    //////
//    
//    
//    
//    
//    
//    
//    
//}
//
//
//-(void) drawBucketAtPoint:(CGPoint) point size:(CGSize) size{
//    CGFloat boundryThickness = 10.0;
//    CGSize bucketFloorSize = CGSizeMake(size.width, boundryThickness);
//    CGSize bucketWallSize= CGSizeMake(boundryThickness, size.height);
//    SKColor* bucketColor = SKColor.blueColor;
//    
//    SKSpriteNode* bucketFloor=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketFloorSize];
//    
//    bucketFloor.position=point;
//    //CGPointMake(CGRectGetMaxX(self.frame)+ (bucketFloor.size.width/2)-(bucketFloor.size.width), CGRectGetMinY(self.frame));
//    [self addChild:bucketFloor];
//    
//    bucketFloor.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketFloor.size];
//    bucketFloor.physicsBody.dynamic=NO;
//    
//    SKSpriteNode* bucketWallA=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketWallSize];
//    
//    bucketWallA.position= CGPointMake(bucketFloor.position.x-bucketFloor.size.width/2+bucketWallA.size.width/2,bucketFloor.position.y+bucketWallA.size.height/2);//+bucketFloor.size.height);
//    //bucketWallA.zPosition=100;
//    
//    [self addChild:bucketWallA];
//    
//    bucketWallA.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketWallA.size];
//    bucketWallA.physicsBody.dynamic=NO;
//    
//    SKSpriteNode* bucketWallB=[SKSpriteNode spriteNodeWithColor:bucketColor size:bucketWallSize];
//    
//    bucketWallB.position= CGPointMake(CGRectGetMaxX(bucketFloor.frame)-bucketWallB.size.width+bucketWallB.size.width/2, bucketFloor.position.y+bucketWallB.size.height/2);//+bucketFloor.size.height);
//    //bucketWallA.zPosition=100;
//    [self addChild:bucketWallB];
//    
//    bucketWallB.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:bucketWallB.size];
//    bucketWallB.physicsBody.dynamic=NO;
//    
//    
//    
//    
//}
//
//-(void) drawBalls:(NSInteger) quantity{
//    
//    for (int i=1; i<=quantity; i++) {
//        
//        
//        SKSpriteNode * ball = [SKSpriteNode spriteNodeWithImageNamed:ballImageFile];
//        [ballsArray addObject:ball];
//        
//        ball.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMinY(self.frame));
//        
//        //CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
//        //[structureComponents addObject:ball];
//        [self addChild:ball];
//        
//        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width/2.0];
//        ball.physicsBody.categoryBitMask=BallCategory;
//        ball.physicsBody.collisionBitMask=BallCategory;
//        ball.physicsBody.contactTestBitMask=BallCategory;
//        ball.physicsBody.dynamic=YES;
//        ball.physicsBody.affectedByGravity=YES;
//        //ball.physicsBody.mass=BallMass;
//        
//        
//    }
//    
//}
//
///*-(void) drawStructure:(NSInteger) levels{
//    
//    if( [structureComponents count] > 0){
//        [self removeChildrenInArray:structureComponents];
//        [structureComponents removeAllObjects];
//        
//    }
//    
//    CGFloat floorY=25;
//    CGPoint structurePosition=CGPointMake(100, floorY);//CGPointMake(CGRectGetMidX(self.frame)-150, 50);
//    
//    int rows=2;
//    int rowLength=10;
//    
//    for (int j=1; j<=rows; j++) {
//        
//    
//        //int levelsPerColumn=1;
//        
//        [self drawRowAtPoint:structurePosition ofLength:rowLength];
//        
//        rowLength-=2;
//        structurePosition.x+=horizontalWidth;
//        structurePosition.y+=verticalHeight+horizontalWidth;
//        
//        //structurePosition.y=50;
//        //structurePosition.x+=(horizontalWidth-verticalWidth);
//        //structurePosition.x = structurePosition.x + [self getNormalHorizontalBlcokSize].width+10;
//    }
//    
//    //for(int j=0; j<verticalBlocks-1;j++){
//        
//    //}
//    
//    
//    
//    
//    
//    //block.physicsBody.density=1;
//    //block.physicsBody.mass=1;
//    
//    
//    
//    
//}*/
//
///*-(void) drawRowAtPoint:(CGPoint) point ofLength:(NSInteger) length {
//    
//    CGPoint structurePosition=point;
//    
//    for(int i=1;i<=length;i++){
//        
//        
//        [self drawThreeBlockRoomStructureAtPoint:structurePosition];
//        
//        
//        structurePosition.x+=horizontalWidth;
//        
//        
//    }
//    
//    
//}*/
//
///*-(CGSize) getNormalVerticalBlockSize{
//    return [SKSpriteNode spriteNodeWithImageNamed:VerticalBlockImageFile].size;
//    
//}*/
//
///*-(CGSize) getNormalHorizontalBlcokSize{
//    
//     return[SKSpriteNode spriteNodeWithImageNamed:HorizontalBlockImageFile].size;
//
//}*/
//
///*-(void) drawThreeBlockRoomStructureAtPoint:(CGPoint) point{
//    
//    
//    SKSpriteNode* horizontalBlockA=[SKSpriteNode spriteNodeWithColor:SKColor.blackColor size:CGSizeMake(horizontalWidth, horizontalHeight)];
//    
//    
//    //SKSpriteNode* horizontalBlockA = [SKSpriteNode spriteNodeWithImageNamed:HorizontalBlockImageFile];
//    
//    
//   // SKSpriteNode * verticalBlockA = [SKSpriteNode spriteNodeWithImageNamed:VerticalBlockImageFile];
//    
//    SKSpriteNode * verticalBlockA = [SKSpriteNode spriteNodeWithColor:SKColor.blackColor size:CGSizeMake(verticalWidth, verticalHeight)];
//    
//    verticalBlockA.position = point;// = CGPointMake(blockGridX.x+horizontalBlock.size.width,blockGridX.y);
//    
//    //CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
//    [structureComponents addObject:verticalBlockA];
//    [self addChild:verticalBlockA];
//    [self normalBlockPhysics:verticalBlockA];
//    
//    
//    //SKSpriteNode * verticalBlockB = [SKSpriteNode spriteNodeWithImageNamed:VerticalBlockImageFile];
//    SKSpriteNode * verticalBlockB = [SKSpriteNode spriteNodeWithColor:SKColor.blackColor size:CGSizeMake(verticalWidth,verticalHeight)];
//    
//    verticalBlockB.position = CGPointMake(verticalBlockA.position.x+horizontalBlockA.size.width-verticalBlockB.size.width, verticalBlockA.position.y);
//    [structureComponents addObject:verticalBlockB];
//    [self addChild:verticalBlockB];
//    [self normalBlockPhysics:verticalBlockB];
//    
//    
//    
//    horizontalBlockA.position = CGPointMake(verticalBlockA.position.x+verticalBlockA.size.width, verticalBlockA.position.y+verticalBlockA.size.height);
//    [structureComponents addObject:horizontalBlockA];
//    [self addChild:horizontalBlockA];
//    [self normalBlockPhysics:horizontalBlockA];
//    
//    
//    
//}*/
//
//-(void) normalBlockPhysics: (SKSpriteNode*) block{
//    
//    block.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:block.size];
//    block.physicsBody.dynamic=YES;
//    block.physicsBody.affectedByGravity=YES;
//    block.physicsBody.mass=5;
//    
//    
//}
//
///*-(void) drawCraneAtPoint:(CGPoint) point{
//    
//    if( [craneComponents count] > 0){
//        [self removeChildrenInArray:craneComponents];
//        [craneComponents removeAllObjects];
//    }
//    
//    [self drawRopeHanger:point];
//    [self drawWreckingBall];
//    [self drawRope];
//    
//    
//}*/
//
///*-(void) drawRopeHanger:(CGPoint) position{
//    
//    //edgeNode=[SKSpriteNode sp]
//    
//    ropeHangerNode = [SKSpriteNode spriteNodeWithImageNamed:@"ropehanger.png"];
//    [craneComponents addObject:ropeHangerNode];
//    
//    ropeHangerNode.name=@"ropehanger";
//    ropeHangerNode.position=position;
//    [self addChild:ropeHangerNode];
//    
//    ropeHangerNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:ropeHangerNode.size];
//    ropeHangerNode.physicsBody.dynamic=FALSE;
//    
//}*/
//
///*-(void) drawWreckingBall{
//   
//    wreckingBallShapeNode=[SKSpriteNode spriteNodeWithImageNamed:@"wreckingball.png"];
//    [craneComponents addObject:wreckingBallShapeNode];
//    
//    wreckingBallShapeNode.zPosition=100.0;
//    //self.wreckingBallShapeNode.position=point;
//    wreckingBallShapeNode.name = @"wreckingball";
//    //[self.scene addChild:self.wreckingBallShapeNode];
//    [self addChild:wreckingBallShapeNode];
//    
//    //wreckingBallShapeNode.physicsBody=[SKPhysicsBody bodyWithCircleOfRadius:(wreckingBallShapeNode.size.width/2.0)];
//    //wreckingBallShapeNode.physicsBody.allowsRotation=TRUE;
//    
//    //wreckingBallShapeNode.physicsBody.dynamic=TRUE;
//    //wreckingBallShapeNode.physicsBody.affectedByGravity=TRUE;
// 
//    wreckingBallShapeNode.physicsBody.mass=1;
//    //wreckingBallShapeNode.physicsBody.friction=wreckingBallFriction;
//    //wreckingBallShapeNode.physicsBody.categoryBitMask=WreckingBallCategory;
//    //NSLog(@"%d",WreckingBallCategory);
//    //self.wreckingBallShapeNode.physicsBody.collisionBitMask=BlockCategory;
//    //self.wreckingBallShapeNode.physicsBody.contactTestBitMask=BlockCategory;
//    SKAction* d;
//     
//}*/
//
///*-(void) drawRope{
//    
//    SKSpriteNode *firstRopeSectionNode = [SKSpriteNode spriteNodeWithImageNamed:@"ropesection.png"];
//    [craneComponents addObject:firstRopeSectionNode];
//    
//    firstRopeSectionNode.position=CGPointMake(CGRectGetMidX(ropeHangerNode.frame), CGRectGetMinY(ropeHangerNode.frame));
//    
//    firstRopeSectionNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:firstRopeSectionNode.size];
//    firstRopeSectionNode.physicsBody.mass=1;
//    firstRopeSectionNode.physicsBody.affectedByGravity=YES;
//    firstRopeSectionNode.physicsBody.allowsRotation=TRUE;
//    firstRopeSectionNode.zPosition=100.0;
//    
//    CGPoint firstAnchorPoint=CGPointMake(CGRectGetMidX(ropeHangerNode.frame),(CGRectGetMinY(ropeHangerNode.frame)));
//    
//    SKPhysicsJointPin *firstJointPin=[SKPhysicsJointPin
//                                      jointWithBodyA:ropeHangerNode.physicsBody
//                                      bodyB:firstRopeSectionNode.physicsBody
//                                      anchor:firstAnchorPoint]  ;
//    
//    
//    [self addChild:firstRopeSectionNode];
//    [self.scene.physicsWorld addJoint:firstJointPin];
//    
//    SKSpriteNode *previousRopeSection=firstRopeSectionNode;
//    SKSpriteNode *currentRopeSection;
//    
//    for(int section=1; section<(10); section++){
//        
//        currentRopeSection = [SKSpriteNode spriteNodeWithImageNamed:@"ropesection.png"];
//        [craneComponents addObject:currentRopeSection];
//        
//        currentRopeSection.position = CGPointMake(previousRopeSection.position.x,CGRectGetMinY(previousRopeSection.frame)-(currentRopeSection.size.height));
//        
//        currentRopeSection.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:currentRopeSection.size];
//        currentRopeSection.physicsBody.mass=1;
//        currentRopeSection.physicsBody.allowsRotation=TRUE;
//        currentRopeSection.zPosition=100.0;
//  
//        SKPhysicsJointPin *jointPin=[SKPhysicsJointPin jointWithBodyA:
//                                     previousRopeSection.physicsBody
//                                                                bodyB:currentRopeSection.physicsBody
//                                                               anchor:CGPointMake(CGRectGetMidX(previousRopeSection.frame),(CGRectGetMinY(previousRopeSection.frame)))]  ;
//        
//        
//        [self addChild:currentRopeSection];
//        [self.physicsWorld addJoint:jointPin];
//        previousRopeSection=currentRopeSection;
//    }
//    
//    //attach wrecking ball
//    wreckingBallShapeNode.position= CGPointMake(previousRopeSection.position.x,CGRectGetMinY(previousRopeSection.frame));
//    
//    wreckingBallShapeNode.physicsBody=[SKPhysicsBody bodyWithCircleOfRadius:(wreckingBallShapeNode.size.width/2.0)];
//    wreckingBallShapeNode.physicsBody.allowsRotation=TRUE;
//    
//    wreckingBallShapeNode.physicsBody.dynamic=TRUE;
//    wreckingBallShapeNode.physicsBody.affectedByGravity=TRUE;
//    
//    wreckingBallShapeNode.physicsBody.mass=1;
//    
//    
//    
//    SKPhysicsJointPin* lastJointPin=[SKPhysicsJointPin jointWithBodyA:previousRopeSection.physicsBody
//                                                                      bodyB:wreckingBallShapeNode.physicsBody
//                                                               anchor:CGPointMake(CGRectGetMidX(previousRopeSection.frame),(CGRectGetMaxY(previousRopeSection.frame)))];
//    
//    [self.physicsWorld addJoint:lastJointPin];
//    
//}*/
//
//-(void) update:(NSTimeInterval)currentTime{
//    
//    /*if (ballsArray.count>0) {
//     
//     
//     for(SKSpriteNode* ballA in ballsArray){
//         
//         for(SKSpriteNode* ballB in ballsArray){
//             
//             if(ballA!=ballB){
//                
//                 if([ballA intersectsNode:ballB]){
//                     [self runAction:[SKAction playSoundFileNamed:soundBallsCollisionFile waitForCompletion:NO]];
//                 
//                 }
//             }
//             
//         }
//     
//         
//     
//     }
//     }*/
//    
//    
//    /*if (structureComponents.count>0) {
//     
//    
//        for(SKSpriteNode* block in structureComponents){
//            
//            if([block intersectsNode:bucketFloor]){
//                //[block.physicsBody ]
//                block.physicsBody.dynamic=NO;
//            }
//        
//        }
//    }*/
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//    
//    //moveTouchHappend=TRUE;
//    
//    //UITouch* latestTouch= touches.
//    
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//
//    /*if(touchBeginAtRopeHanger && moveTouchHappend){
//        UITouch* touch = [touches anyObject];
//        CGPoint touchEndPoint = [touch locationInNode:self];
//        //ropeHangerNode.position=touchEndPoint;
//        [self drawCraneAtPoint:touchEndPoint] ;//]:self.frame.size];
//        NSLog(@"Rope hanger position changed");
//        
//    }*/
//
//}
//
//
//    
//
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    //moveTouch=FALSE;
//    //touchStartInWreckingBall=FALSE;
//    
//    //if(touches.count==2){
//    //  [wreckingBall.wreckingBallShapeNode.physicsBody applyImpulse:CGVectorMake(10, 0)];
//    // }
//    //moveTouchHappend=FALSE;
//    UITouch *touch = [touches anyObject];
//    CGPoint touchPoint = [touch locationInNode:self];
//    
//    
//    NSArray* nodesAtTouch= [self nodesAtPoint:touchPoint];
//    
//    for(SKNode* node in nodesAtTouch){
//        
//        CGFloat xImpulseVector= (node.physicsBody.mass)*1000.0;
//        CGFloat yImpulseVector= (node.physicsBody.mass)*2000.0;
//        
//        CGFloat cylinderXImpulseFactor = (wreckingBallCylinder.physicsBody.mass)*5000;
//        CGFloat cylinderYImpulseFactor= (wreckingBallCylinder.physicsBody.mass)*1000;
//        
//        if(node.position.x>CGRectGetMidX(self.frame)){
//            
//            [node.physicsBody applyImpulse:CGVectorMake(-1.0*xImpulseVector, yImpulseVector)];
//            
//            
//            if(currentGameLevel==4 && node.physicsBody.categoryBitMask==BallCategory){
//                if(wreckingBallCylinder){
//                    [wreckingBallCylinder.physicsBody applyImpulse:CGVectorMake(1.0*cylinderXImpulseFactor,cylinderYImpulseFactor)];
//                    NSLog(@"cylinder moved");
//                }
//            }
//        
//            
//        }else{
//            
//            [node.physicsBody applyImpulse:CGVectorMake(xImpulseVector, yImpulseVector)];
//            
//            if(currentGameLevel==4 && node.physicsBody.categoryBitMask==BallCategory){
//                if(wreckingBallCylinder){
//                    [wreckingBallCylinder.physicsBody applyImpulse:CGVectorMake(-1.0*cylinderXImpulseFactor,cylinderYImpulseFactor)];
//                    NSLog(@"cylinder moved");
//                }
//            }
//        }
//        
//        
//        
//        //[node.physicsBody applyAngularImpulse:(10.0) ];// CGVectorMake(1000,10000)];
//    }
//    
//    
//    
//    /*if(CGRectContainsPoint(wreckingBallShapeNode.frame, touchPoint)){
//        [wreckingBallShapeNode.physicsBody applyImpulse:CGVectorMake(2000, 0)];
//        //touchStartInWreckingBall=TRUE;
//    }else if(CGRectContainsPoint(ropeHangerNode.frame, touchPoint)){
//        touchBeginAtRopeHanger=YES;
//    }*/
//    
//    //else{
//      //  SKAction *moveAction = [SKAction moveTo:touchPoint duration:1.0];
//       // [wreckingBall.wreckingBallShapeNode runAction:moveAction];
//   // }
//    //[touch ]
//    
//    /*for(UITouch *touch in touches){
//     
//     moveStartPoint=[touch locationInNode:self];
//     //SKNode *wreckingBallNode=[self childNodeWithName:]
//     
//     }
//     
//     for (UITouch *touch in touches) {
//     CGPoint location = [touch locationInNode:self];
//     
//     SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//     
//     sprite.position = location;
//     
//     SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//     
//     [sprite runAction:[SKAction repeatActionForever:action]];
//     
//     [self addChild:sprite];
//     }*/
//}
//
//-(void) didMoveToView:(SKView *)view{
//    
//    NSLog(@"%@",@"didMoveToView");
//    //self.physicsWorld.contactDelegate=self;
//    //[self drawScene:self.frame.size];
//}
//
//
//- (void) didBeginContact:(SKPhysicsContact *)contact{
//    //NSLog(@"didBeginContact");
//    
//    /*if(contact.bodyA.categoryBitMask==BallCategory && contact.bodyB.categoryBitMask==BallCategory){
//        if(contact.collisionImpulse>1000){
//    
//            [self runAction:[SKAction playSoundFileNamed:soundBallsCollisionFile waitForCompletion:NO]];
//        }
//    }*/
//    //contact.bodyA
//    //[wreckingBall.wreckingBallShapeNode.physicsBody applyImpulse:CGVectorMake(3, 10)];
//    
//}
//
//
//@end
