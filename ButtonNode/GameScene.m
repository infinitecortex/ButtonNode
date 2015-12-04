//
//  GameScene.m
//  ButtonNode
//
//  Created by Mark Johnson on 11/29/15.
//  Copyright (c) 2015 Infiinte Cortex LLC. All rights reserved.
//

#import "GameScene.h"
#import "ButtonNode.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    [self addMyButton];
}

-(void)addMyButton {
    ButtonNode *myButton = [ButtonNode buttonWithImageNamed:@"myButtonImage" forTarget:self andSelector:@selector(myButtonAction)];
    myButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:myButton];
}

-(void)addMessage {
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    myLabel.text = @"Shall we play a game!";
    myLabel.fontSize = 25;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)*0.75);
    [self addChild:myLabel];
}

-(void)myButtonAction {
    [self addMessage];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
