//
//  Bucket.h
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Bucket : SKNode
@property u_int8_t numberOfBucket;
@property CGFloat bucketWidth;
@property CGPoint bucketPosition;

-(void) drawLargeBucket;

@end
