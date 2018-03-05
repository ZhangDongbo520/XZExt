//
//  CALayer+Animation.h
//  XZPopView
//
//  Created by Zeasn on 2017/7/4.
//  Copyright © 2017年 Zeasn. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "XZSpringAnimation.h"
#import "XZKeyframeAnimation.h"
#import "XZBasicAnimation.h"

@interface CALayer (Animation)

- (void)addSpringAnimationWithKeyPathType:(KeyPathType)type withBlock:(void(^)(XZSpringAnimation *animation))block;
- (void)addKeyframeAnimationWithKeyPathType:(KeyPathType)type withBlock:(void(^)(XZKeyframeAnimation *animation))block;
- (void)addBasicAnimationWithKeyPathType:(KeyPathType)type withBlock:(void(^)(XZBasicAnimation *animation))block;
- (void)addBasicAnimationWithKeyPathType:(KeyPathType)type key:(NSString *)key withBlock:(void (^)(XZBasicAnimation *))block;

/**
 *  添加转场动画
 *
 *  @param animationType 转场类型
 *  @param subType 转场方向
 *  @param duration 持续时间
 *
 *  @return CATransition
 */
- (CATransition *)addTranstionWithAnimationType:(XZTransitionAnimationType )animationType  subType:(XZTransitionAnimationSubType) subType duartion:(CFTimeInterval)duration;

@end
