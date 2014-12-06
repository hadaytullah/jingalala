//
//  GameState.h
//  Jingalala
//
//  Created by Hadaytullah on 03/04/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StartScene.h"



@interface GameState:NSObject{
    //static GameState* gameState;
    NSMutableDictionary* dataDictionary;
    //const NSString* ballsArray=@"ballsArray";
}


//@property NSMutableArray* ballsPosition;
@property u_int8_t currentLevel;
@property BOOL currentLevelEnded;
@property BOOL iAdsEnable;
@property NSMutableArray* unlockLevels;
@property StartScene *scene;


-(void) storeState;
-(void) loadState;

+ (GameState*) getGameState;


@end
