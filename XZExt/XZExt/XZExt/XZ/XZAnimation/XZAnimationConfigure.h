//
//  XZAnimationConfigure.h
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

typedef enum{
    KeyPathTypePositionX,
    KeyPathTypePositionY,
    KeyPathTypePosition,
    KeyPathTypeCornerRadius,
    KeyPathTypeTransformScale,
    KeyPathTypeTransformRotationZ,
    KeyPathTypeTransformRotationX,
    KeyPathTypeTransformRotationY,
    KeyPathTypeBounds,
    KeyPathTypeTransform,
    KeyPathTypeOpacity,
    KeyPathTypeBackgroundColor,
    KeyPathTypeBorderWidth,
    KeyPathTypeFrame,
    KeyPathTypeHidden,
    KeyPathTypeMask,
    KeyPathTypeMasksToBounds,
    KeyPathTypeShadowColor,
    KeyPathTypeShadowOffset,
    KeyPathTypeShadowOpacity,
    KeyPathTypeShadowRadius
}KeyPathType;

typedef enum : NSUInteger {
    XZTransitionAnimationNone,
    XZTransitionAnimationFade,
    XZTransitionAnimationMoveIn,
    XZTransitionAnimationPush,
    XZTransitionAnimationReveal
} XZTransitionAnimationType;

typedef enum : NSUInteger {
    XZTransitionAnimationFromDefault,
    XZTransitionAnimationFromRight,
    XZTransitionAnimationFromLeft,
    XZTransitionAnimationFromTop,
    XZTransitionAnimationFromBottom
} XZTransitionAnimationSubType;

