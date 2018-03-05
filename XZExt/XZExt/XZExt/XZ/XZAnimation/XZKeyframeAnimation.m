//
//  XZKeyframeAnimation.m
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "XZKeyframeAnimation.h"

@implementation XZKeyframeAnimation

+ (instancetype)animationWithKeyPathType:(KeyPathType)type{
    NSString *path = [XZKeyframeAnimation getStringWithKeyPathType:type];
    return [super animationWithKeyPath:path];
}

+ (NSString *)getStringWithKeyPathType:(KeyPathType)type{
    switch (type) {
        case KeyPathTypePositionX:
            return @"position.x";
        case KeyPathTypePositionY:
            return @"position.y";
        case KeyPathTypePosition:
            return @"position";
        case KeyPathTypeCornerRadius:
            return @"cornerRadius";
        case KeyPathTypeTransformScale:
            return @"transform.scale";
        case KeyPathTypeTransformRotationZ:
            return @"transform.rotation.z";
        case KeyPathTypeTransformRotationX:
            return @"transform.rotation.x";
        case KeyPathTypeTransformRotationY:
            return @"transform.rotation.y";
        case KeyPathTypeBounds:
            return @"bounds";
        case KeyPathTypeTransform:
            return @"transform";
        case KeyPathTypeOpacity:
            return @"opacity";
        case KeyPathTypeBackgroundColor:
            return @"backgroundColor";
        case KeyPathTypeBorderWidth:
            return @"borderWidth";
        case KeyPathTypeFrame:
            return @"frame";
        case KeyPathTypeHidden:
            return @"hidden";
        case KeyPathTypeMask:
            return @"mask";
        case KeyPathTypeMasksToBounds:
            return @"masksToBounds";
        case KeyPathTypeShadowColor:
            return @"shadowColor";
        case KeyPathTypeShadowOffset:
            return @"shadowOffset";
        case KeyPathTypeShadowOpacity:
            return @"shadowOpacity";
        case KeyPathTypeShadowRadius:
            return @"shadowRadius";
        default:
            break;
    }
    return @"";
}

@end

