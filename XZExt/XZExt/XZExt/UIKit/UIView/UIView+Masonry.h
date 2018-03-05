//
//  UIView+Masonry.h
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "Masonry.h"

@interface UIView (Masonry)

- (void)constraintWithFrame:(CGRect)frame;

- (void)constraintWithHeight:(CGFloat)height top:(CGFloat)top  left:(CGFloat)left right:(CGFloat)right;
- (void)constraintWithHeight:(CGFloat)height bottom:(CGFloat)bottom  left:(CGFloat)left right:(CGFloat)right;

- (void)constraintWithEdgeZero;
- (void)constraintWithEdgeZeroWithView:(UIView *)view;
- (void)constraintWithEdge:(UIEdgeInsets)edge;

- (void)remakeConstraintWithEdge:(UIEdgeInsets)edge;

- (void)updateTopWithOffset:(CGFloat) offset;
- (void)updateLeftWithOffset:(CGFloat) offset;
- (void)updateBottomWithOffset:(CGFloat) offset;
- (void)updateRightWithOffset:(CGFloat) offset;


@end
