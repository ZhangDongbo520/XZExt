//
//  XZBasicAnimation.h
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "XZAnimationConfigure.h"

@interface XZBasicAnimation : CABasicAnimation

+ (instancetype)animationWithKeyPathType:(KeyPathType)type;

@end
