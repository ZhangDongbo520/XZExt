//
//  UIView+Masonry.m
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "UIView+Masonry.h"

@implementation UIView (Masonry)

//- (void)constraintWithFrame:(CGRect)frame{
//    assert(self.superview);
//    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.superview).offset(frame.origin.y);
//        make.left.equalTo(self.superview).offset(frame.origin.x);
//        make.width.mas_equalTo(frame.size.width);
//        make.height.mas_equalTo(frame.size.height);
//    }];
//}
//
//- (void)constraintWithHeight:(CGFloat)height top:(CGFloat)top  left:(CGFloat)left right:(CGFloat)right{
//    assert(self.superview);
//    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.superview).offset(top);
//        make.left.equalTo(self.superview).offset(left);
//        make.right.equalTo(self.superview).offset(right);
//        make.height.mas_equalTo(height);
//    }];
//}
//
//- (void)constraintWithHeight:(CGFloat)height bottom:(CGFloat)bottom  left:(CGFloat)left right:(CGFloat)right{
//    assert(self.superview);
//    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.superview).offset(bottom);
//        make.left.equalTo(self.superview).offset(left);
//        make.right.equalTo(self.superview).offset(right);
//        make.height.mas_equalTo(height);
//    }];
//}
//
//- (void)constraintWithEdgeZero{
//    [self constraintWithEdge:UIEdgeInsetsZero];
//}
//
//- (void)constraintWithEdgeZeroWithView:(UIView *)view{
//    assert(view != nil);
//    [self mas_makeConstraints:^(MASConstraintMaker *make){
//        make.top.equalTo(view);
//        make.left.equalTo(view);
//        make.right.equalTo(view);
//        make.bottom.equalTo(view);
//    }];
//}
//
//- (void)constraintWithEdge:(UIEdgeInsets)edge{
//    assert(self.superview != nil);
//    [self mas_remakeConstraints:^(MASConstraintMaker *make){
//        make.top.equalTo(self.superview).offset(edge.top);
//        make.left.equalTo(self.superview).offset(edge.left);
//        make.right.equalTo(self.superview).offset(-edge.right);
//        make.bottom.equalTo(self.superview).offset(-edge.bottom);
//    }];
//}
//
//- (void)remakeConstraintWithEdge:(UIEdgeInsets)edge{
//    assert(self.superview != nil);
//    [self mas_remakeConstraints:^(MASConstraintMaker *make){
//        make.top.equalTo(self.superview).offset(edge.top);
//        make.left.equalTo(self.superview).offset(edge.left);
//        make.right.equalTo(self.superview).offset(-edge.right);
//        make.bottom.equalTo(self.superview).offset(-edge.bottom);
//    }];
//}
//
//- (void)updateTopWithOffset:(CGFloat)offset{
//    assert(self.superview != nil);
//    [self mas_updateConstraints:^(MASConstraintMaker *make){
//        make.top.equalTo(self.superview).offset(offset);
//    }];
//}
//
//- (void)updateLeftWithOffset:(CGFloat)offset{
//    assert(self.superview != nil);
//    [self mas_updateConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(self.superview).offset(offset);
//    }];
//}
//
//- (void)updateBottomWithOffset:(CGFloat)offset{
//    assert(self.superview != nil);
//    [self mas_updateConstraints:^(MASConstraintMaker *make){
//        make.bottom.equalTo(self.superview).offset(offset);
//    }];
//}
//
//- (void)updateRightWithOffset:(CGFloat)offset{
//    assert(self.superview != nil);
//    [self mas_updateConstraints:^(MASConstraintMaker *make){
//        make.bottom.equalTo(self.superview).offset(offset);
//    }];
//}

@end
