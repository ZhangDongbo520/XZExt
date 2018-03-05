//
//  CALayer+Animation.m
//  XZPopView
//
//  Created by Zeasn on 2017/7/4.
//  Copyright © 2017年 Zeasn. All rights reserved.
//

#import "CALayer+Animation.h"

@implementation CALayer (Animation)

- (void)addSpringAnimationWithKeyPathType:(KeyPathType)type withBlock:(void (^)(XZSpringAnimation *))block{
    XZSpringAnimation *animation = [XZSpringAnimation animationWithKeyPathType:type];
    block(animation);
    [self addAnimation:animation forKey:nil];
}

- (void)addKeyframeAnimationWithKeyPathType:(KeyPathType)type withBlock:(void (^)(XZKeyframeAnimation *))block{
    XZKeyframeAnimation * animation = [XZKeyframeAnimation animationWithKeyPathType:type];
    block(animation);
    [self addAnimation:animation forKey:nil];
}

- (void)addBasicAnimationWithKeyPathType:(KeyPathType)type withBlock:(void (^)(XZBasicAnimation *))block{
    [self addBasicAnimationWithKeyPathType:type key:nil withBlock:block];
}

- (void)addBasicAnimationWithKeyPathType:(KeyPathType)type key:(NSString *)key withBlock:(void (^)(XZBasicAnimation *))block{
    XZBasicAnimation * animation = [XZBasicAnimation animationWithKeyPathType:type];
    block(animation);
    [self addAnimation:animation forKey:key];
}

- (CATransition *)addTranstionWithAnimationType:(XZTransitionAnimationType )animationType  subType:(XZTransitionAnimationSubType) subType duartion:(CFTimeInterval)duration{
    CATransition *animation = [CATransition animation];
    animation.duration = duration;
    animation.type = [self getCAtransitionTypeWithType:animationType];
    NSString *subTypeStr = [self getCAtransitionSubTypeWithType:subType];
    if (![subTypeStr isEqualToString:@""]) {
        animation.subtype = subTypeStr;
    }
    [self addAnimation:animation forKey:@"transition"];
    return animation;
}

- (NSString *)getCAtransitionTypeWithType:(XZTransitionAnimationType)animationType{
    switch (animationType) {
        case XZTransitionAnimationFade:
            return kCATransitionFade;
        case XZTransitionAnimationPush:
            return kCATransitionPush;
        case XZTransitionAnimationMoveIn:
            return kCATransitionMoveIn;
        case XZTransitionAnimationReveal:
            return kCATransitionReveal;
        default:
            break;
    }
    return @"";
}

- (NSString *)getCAtransitionSubTypeWithType:(XZTransitionAnimationSubType)animationSubType{
    switch (animationSubType) {
        case XZTransitionAnimationFromTop:
            return kCATransitionFromTop;
        case XZTransitionAnimationFromLeft:
            return kCATransitionFromLeft;
        case XZTransitionAnimationFromRight:
            return kCATransitionFromRight;
        case XZTransitionAnimationFromBottom:
            return kCATransitionFromBottom;
        default:
            break;
    }
    return @"";
}

@end
