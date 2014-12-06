//
//  LevelViewController.m
//  WreckingBall
//
//  Created by Hadaytullah on 27/03/14.
//  Copyright (c) 2014 Hadaytullah. All rights reserved.
//

#import "LevelViewController.h"
#import "StartScene.h"

@interface LevelViewController ()

@end

@implementation LevelViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    SKView* view = (SKView*) self.view;
    
    // if(!view.scene){
    
    // view.showsFPS=FALSE;
     //view.showsNodeCount=FALSE;
     
     //SKScene *scene=[MyScene sceneWithSize:view.bounds.size];
     //scene.scaleMode=SKSceneScaleModeAspectFill;
     //[view presentScene:scene];
     
     SKScene *scene=[StartScene sceneWithSize:CGSizeMake(view.bounds.size.width*2.0, view.bounds.size.height*2.0)];
     NSLog(@"%f",view.bounds.size.width);
     NSLog(@"%f",view.bounds.size.height);
     scene.scaleMode=SKSceneScaleModeAspectFill;
     [view presentScene:scene];
     
    // }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
