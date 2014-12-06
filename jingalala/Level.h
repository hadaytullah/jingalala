//
//  Level.h
//  WreckingBall
//
//  Created by Hadaytullah on 26/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Level <NSObject>

-(void) drawLevel;
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
