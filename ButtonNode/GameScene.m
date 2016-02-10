//
//  GameScene.m
//  ButtonNode
//
//  Created by Mark Johnson on 11/29/15.
//  Copyright (c) 2015 Infiinte Cortex LLC. All rights reserved.
//

#import "GameScene.h"
#import "ButtonNode.h"

@interface GameScene ()
@property (strong, nonatomic) ButtonNode *myButton;
@property (strong, nonatomic) ButtonNode *resetButton;
@property (strong, nonatomic) SKLabelNode *myLabel;

@end


@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    [self addMyButton];
    [self addResetButton];
    [self addMessage];
}

-(void)addMyButton {
    self.myButton = [ButtonNode buttonWithImageNamed:@"myButtonImage" forTarget:self andSelector:@selector(myButtonAction)];
    CGFloat midX = CGRectGetMidX(self.frame);
    self.myButton.position = CGPointMake(midX - self.myButton.size.width, CGRectGetMidY(self.frame));
    [self addChild:self.myButton];
}

-(void)addResetButton {
    self.resetButton = [ButtonNode buttonWithImageNamed:@"resetButtonImage" forTarget:self andSelector:@selector(resetButtonAction)];
    CGFloat midX = CGRectGetMidX(self.frame);
    self.resetButton.position = CGPointMake(midX + self.resetButton.size.width, CGRectGetMidY(self.frame));
    self.resetButton.enable = NO;
    [self addChild:self.resetButton];
}

-(void)addMessage {
    self.myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.myLabel.text = @"Shall we play a game!";
    self.myLabel.fontSize = 25;
    self.myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)*0.75);
}

-(void)myButtonAction {
    [self addChild:self.myLabel];
    self.myButton.enable = NO;
    self.resetButton.enable = YES;
}

-(void)resetButtonAction {
    self.myButton.enable = YES;
    self.resetButton.enable = NO;
    [self.myLabel removeFromParent];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
