//
//  ButtonNode.h
//
//  Copyright (c) 2015 Infinite Cortex LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ButtonNode : SKSpriteNode

@property (assign, nonatomic) BOOL enable;

+(instancetype)buttonWithImageNamed:(NSString*)image forTarget:(id)target andSelector:(SEL)selector;
+(instancetype)buttonWithTexture:(SKTexture*)texture forTarget:(id)target andSelector:(SEL)selector;

@end
