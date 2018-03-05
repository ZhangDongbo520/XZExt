//
//  UIButton+XZExt.h
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XZExt)

// 扩大点击区域
@property (nonatomic, assign) UIEdgeInsets touchAreaInsets;

// 显示菊花
- (void)showIndicator;

// 隐藏菊花
- (void)hideIndicator;

@end
