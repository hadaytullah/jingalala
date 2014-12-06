//
//  GameState.m
//  Jingalala
//
//  Created by Hadaytullah on 03/04/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "GameState.h"
#import <SpriteKit/SpriteKit.h>
#import "SharedResources.h"
//#import "NSNull.h"

static GameState* gameState;

@implementation GameState

+(GameState*) getGameState{
    if (!gameState) {
        gameState = [[GameState alloc] init];
        [gameState loadState];
        NSLog(@"New Game State Initiated");
    }
    return gameState;
}

-(id) init{
    
    if(self=[super init]){
        //self.ballsPosition=[NSMutableArray array];
        
        NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
       NSLog(@"%@",bundleIdentifier);
        
        if([bundleIdentifier isEqualToString:AdsFreeBundle]){
            self.iAdsEnable=NO;
        }else{
            self.iAdsEnable=YES;
        }
        
        self.currentLevel=SelectLevelView;
        self.currentLevelEnded=NO;
        
        self.unlockLevels = [NSMutableArray arrayWithCapacity:totalLevels];
        
        if(totalLevels>1){
            //only first and second levels unlocked
            //[self.unlockLevels replaceObjectAtIndex:0 withObject:NSBool(YES)];
            //[self.unlockLevels replaceObjectAtIndex:1 withObject:NSBool(YES)];
            
            [self.unlockLevels addObject:NSBool(YES)];
            //[self.unlockLevels addObject:NSBool(YES)];
            
            //others locked
            for (int i=1; i<totalLevels; i++) {
                //[self.unlockLevels replaceObjectAtIndex:i withObject:NSBool(NO)];
                [self.unlockLevels addObject:NSBool(NO)];
            }
        }
    }
    return self;
}

-(void) storeState{
    
    if(!dataDictionary){
        dataDictionary=[NSMutableDictionary dictionary];
    }
    
    //[dataDictionary setObject:self.ballsPosition forKey:KeyBallsArray];
   
    //[dataDictionary setObject:NSBool(self.currentLevelOver) forKey:KeyCurrentLevelOverBool];
    
    //[dataDictionary setObject:[NSNumber numberWithInt:self.currentView] forKey:KeyCurrentViewInt];
    
    [dataDictionary setObject:self.unlockLevels forKey:KeyUnlockLevelsArray];
    
    [[NSUserDefaults standardUserDefaults] setObject:dataDictionary forKey:DataKey];
    
  
    
    //return YES;
}

-(void) loadState{
    
    id dataObject= [[[NSUserDefaults standardUserDefaults] objectForKey:DataKey] mutableCopy];
    
    if(!dataObject){
        return;
    }
    
    if([dataObject isKindOfClass:[NSMutableDictionary class]]){
        
        dataDictionary =(NSMutableDictionary*)dataObject;
        
        //self.ballsPosition = (NSMutableArray*)[dataDictionary[KeyBallsArray] mutableCopy];
        //self.currentView =[((NSNumber*)dataDictionary[KeyCurrentViewInt]) intValue];
         self.unlockLevels =(NSMutableArray*)[dataDictionary[KeyUnlockLevelsArray] mutableCopy];
         //self.currentLevelOver= [(NSNumber*)dataDictionary[KeyCurrentViewInt] boolValue];
        
        /*self.ballsPosition =((GameState*)dataObject).ballsPosition;
        self.currentView =((GameState*)dataObject).currentView;
        self.unlockLevels =((GameState*)dataObject).unlockLevels;
        self.currentLevelOver= ((GameState*)dataObject).currentLevelOver;*/
        
    }
    //return YES;
    
}

@end
