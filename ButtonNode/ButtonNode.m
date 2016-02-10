//
//  ButtonNode.m
//  Created by Mark Johnson on 6/11/14.
//  Copyright (c) 2015 Infinite Cortex LLC. All rights reserved.
//

#import "ButtonNode.h"

@interface ButtonNode()
@property (nonatomic) BOOL isSelected;
@property (nonatomic) SEL selector;
@property (nonatomic) id target;
@end

@implementation ButtonNode


// Allocates and initializes a new button node from a named image
+(instancetype)buttonWithImageNamed:(NSString*)image forTarget:(id)target andSelector:(SEL)selector {
    ButtonNode *button = [[ButtonNode alloc] initWithImageNamed:image forTarget:(id)target andSelector:selector];
    return button;
}


// Allocates and initializes a new button node from a sprite in a texture
+(instancetype)buttonWithTexture:(SKTexture*)texture forTarget:(id)target andSelector:(SEL)selector {
    ButtonNode *button = [[ButtonNode alloc] initWithTexture:texture forTarget:(id)target andSelector:selector];
    return button;
}

// Init button with a named image
-(instancetype)initWithImageNamed:(NSString*)image forTarget:(id)target andSelector:(SEL)selector {
    if (self = [super initWithImageNamed:image]) {
        self.target = target;
        self.selector = selector;
        self.userInteractionEnabled = true;
        self.color = [SKColor grayColor];
        self.enable = YES;
    }
    return self;
}

// Init button with a Texture
-(instancetype)initWithTexture:(SKTexture*)texture forTarget:(id)target andSelector:(SEL)selector {
    if (self = [super initWithTexture:texture]) {
        self.target = target;
        self.selector = selector;
        self.userInteractionEnabled = true;
        self.color = [SKColor grayColor];
        self.enable = YES;
    }
    return self;
}

// When the button is touched blend the button color with the image to give it a selected appearance
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];
    if (touches.count == 1 && CGRectContainsPoint(self.frame, touchPoint)){
        [self setSelectedState:YES];
    }
}

/* If the user has touched the botton but not released it and they move their finger outside the area
 of the botton we need to show that it is no longer selected by removing the color blend
*/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];
    if (CGRectContainsPoint(self.frame, touchPoint)) {
        [self setSelectedState:YES];
    } else {
        [self setSelectedState:NO];
    }
}

// When the user release a touhed button, reset the button and call the activate button method
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.isSelected) {
        [self setSelectedState:NO];
        [self activateButton];
    }
}

// Helper method to set or unset the button selected state
- (void)setSelectedState:(BOOL)selected {
    if (selected) {
        self.isSelected = YES;
        self.colorBlendFactor = 0.7;
    } else {
        self.isSelected = NO;
        self.colorBlendFactor = 0.0;
    }
}

// When activated the button will call the selector on the target to invoke the buttons action
- (void)activateButton{
    if (self.target != nil && [self.target respondsToSelector:self.selector]){
        [self.target performSelectorOnMainThread:(self.selector) withObject:self waitUntilDone:NO];
    }
}

// Setter for the enable property.  Update the botton based on the new state
- (void)setEnable:(BOOL)enable {
        if (enable) {
            self.userInteractionEnabled = YES;
            self.alpha = 1.0;
        } else {
            self.userInteractionEnabled = NO;
            self.alpha = 0.5;
        }
        _enable = enable;
}

@end
