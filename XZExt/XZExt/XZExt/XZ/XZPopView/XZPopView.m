//
//  XZPopView.m
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "XZPopView.h"

#import "UIView+XZExt.h"

#import "CALayer+Animation.h"

#define kAnimateTime 0.5f
#define kStiffnessValue 300
#define kMassValue 4
#define kDampValue 100


#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface XZPopView ()

@property (nonatomic, weak) UIView *contentView;//弹出的显示框
@property (nonatomic, weak) UIView *inView;//显示在哪个界面上
@property (nonatomic, strong) UIView *maskView;//遮罩
@property (nonatomic, assign) XZPopStyle popStyle;
@property (nonatomic, weak) id<XZPopViewDelegate> delegate;

@end

@implementation XZPopView

+ (XZPopView *)popWithContentView:(UIView *)contentView inView:(UIView *)inView popStyle:(XZPopStyle)popStyle setContentViewFrameWithBlock:(void (^)(UIView *contentView,UIView *superView))block{
    return [self popWithContentView:contentView inView:inView popStyle:popStyle tapBackgroundClose:YES setContentViewFrameWithBlock:block];
}

+ (XZPopView *)popWithContentView:(UIView *)contentView inView:(UIView *)inView popStyle:(XZPopStyle)popStyle tapBackgroundClose:(BOOL)close setContentViewFrameWithBlock:(void (^)(UIView *contentView,UIView *superView))block{
    return [self popWithContentView:contentView inView:inView popStyle:popStyle tapBackgroundClose:close backgroundAlpha:0.5 delegate:nil setContentViewFrameWithBlock:block];
}

+ (XZPopView *)popWithContentView:(UIView *)contentView inView:(UIView *)inView popStyle:(XZPopStyle)popStyle tapBackgroundClose:(BOOL)close backgroundAlpha:(CGFloat)backgroundAlpha delegate:(id<XZPopViewDelegate> __nullable)delegate setContentViewFrameWithBlock:(void (^)(UIView *contentView,UIView *superView))block{
    return [[self alloc] initWithContentView:contentView inView:inView popStyle:popStyle backgroundAlpha:backgroundAlpha tapBackgroundClose:close delegate:delegate setContentViewFrameWithBlock:block];
}

- (instancetype)initWithContentView:(UIView *)contentView inView:(UIView *)inView popStyle:(XZPopStyle)popStyle backgroundAlpha:(CGFloat)backgroundAlpha tapBackgroundClose:(BOOL)close delegate:(id<XZPopViewDelegate>)delegate setContentViewFrameWithBlock:(void (^)(UIView *contentView, UIView *superview))block {
    self = [self init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView = contentView;
        self.inView = inView;
        self.delegate = delegate;
        
        [self.inView addSubview:self];
        [self addSubview:self.contentView];
        self.size = inView.size;
        
        if (block) {
            block(contentView, self);
        }
        
        if (close) {
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClose:)];
            self.maskView.userInteractionEnabled = true;
            [self.maskView addGestureRecognizer:tap];
        }
        
        [self showContentViewWithPopStyle:popStyle alpha:backgroundAlpha];
    }
    return self;
}

- (void)onClose:(UIGestureRecognizer *)gesture {
    //    [QLXPopView closeWithRootView:self.rootView animated:true];
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0;
        [self addSubview:_maskView];
        [self sendSubviewToBack:_maskView];
    }
    return _maskView;
}

- (void)showMaskViewWithAlpha:(CGFloat)alpha {
    if (self.popStyle != XZPopStyleNone) {
        [UIView animateWithDuration:kAnimateTime animations:^{
            self.maskView.alpha = alpha;
        } completion:^(BOOL finished) {
            //            self.showInView.userInteractionEnabled = true;
        }];
    } else {
        self.maskView.alpha = alpha;
    }
}

- (void)showContentViewWithPopStyle:(XZPopStyle)popStyle alpha:(CGFloat)alpha {
    self.popStyle = popStyle;
    [self showMaskViewWithAlpha:alpha];
    switch (self.popStyle) {
        case XZPopStyleNone:
        {
            break;
        }
        case XZPopStyleFade:
        {
            [self showContentViewByFade];
            break;
        }
        case XZPopStyleScale:
        {
            [self showContentViewByScale];
            break;
        }
        case XZPopStyleFromTop:
        {
            [self showContentViewByFromTop];
            break;
        }
        case XZPopStyleFromLeft:
        {
            [self showContentViewByFromLeft];
            break;
        }
        case XZPopStyleFromRight:
        {
            [self showContentViewByFromRight];
            break;
        }
        case XZPopStyleFromBottom:
        {
            [self showContentViewByFromBottom];
            break;
        }
        case XZPopStyleScaleBounces:
        {
            [self showContentViewByScaleBounces];
            break;
        }
        case XZPopStyleFromTopBounces:
        {
            [self showContentViewByFromTopBounces];
            break;
        }
        case XZPopStyleFromLeftBounces:
        {
            [self showContentViewByFromLeftBounces];
            break;
        }
        case XZPopStyleFromRightBounces:
        {
            [self showContentViewByFromRightBounces];
            break;
        }
        case XZPopStyleFromBottomBounces:
        {
            [self showContentViewByFromBottomBounces];
            break;
        }
        default:
            break;
    }
}

- (void)showContentViewByFade{
    self.contentView.alpha = 0;
    [UIView animateWithDuration:kAnimateTime animations:^{
        self.contentView.alpha = 1;
    }];
}

- (void)showContentViewByScale{
    [self.contentView.layer addBasicAnimationWithKeyPathType:KeyPathTypeTransformScale withBlock:^(XZBasicAnimation *animation) {
        animation.fromValue = @(0);
        animation.toValue = @(1);
    }];
}

- (void)showContentViewByFromTop{
    [self.contentView.layer addBasicAnimationWithKeyPathType:KeyPathTypePositionY withBlock:^(XZBasicAnimation *animation) {
        animation.fromValue = @(self.contentView.y - kScreenHeight);
        animation.toValue = @(self.contentView.y);
    }];
}

- (void)showContentViewByFromLeft{
    [self.contentView.layer addBasicAnimationWithKeyPathType:KeyPathTypePositionY withBlock:^(XZBasicAnimation *animation) {
        animation.fromValue = @(self.contentView.x - kScreenWidth);
        animation.toValue = @(self.contentView.x);
    }];
}

- (void)showContentViewByFromRight{
    [self.contentView.layer addBasicAnimationWithKeyPathType:KeyPathTypePositionY withBlock:^(XZBasicAnimation *animation) {
        animation.fromValue = @(self.contentView.x + kScreenWidth);
        animation.toValue = @(self.contentView.x);
    }];
}

- (void)showContentViewByFromBottom{
    [self.contentView.layer addBasicAnimationWithKeyPathType:KeyPathTypePositionY withBlock:^(XZBasicAnimation *animation) {
        animation.fromValue = @(self.contentView.y + kScreenHeight);
        animation.toValue = @(self.contentView.y);
    }];
}

- (void)showContentViewByScaleBounces{
    //    CGSize size = self.contentView.size;
    //    CGPoint center = self.contentView.center;
    //    self.contentView.size = CGSizeZero;
    //    self.contentView.center = center;
    //    [UIView animateWithDuration:kAnimateTime delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:5.0 options:0 animations:^{
    //        self.contentView.size = size;
    //        self.contentView.center = center;
    //    } completion:^(BOOL finished) {
    //
    //    }];
    
    [self.contentView.layer addKeyframeAnimationWithKeyPathType:KeyPathTypeTransformScale withBlock:^(XZKeyframeAnimation *animation) {
        animation.values = @[@0,@1.15,@0.85,@1.0];
        animation.duration = 0.3;
    }];
}

- (void)showContentViewByFromTopBounces{
    CGFloat y = self.contentView.y;
    self.contentView.y = self.contentView.y - kScreenHeight;
    [UIView animateWithDuration:kAnimateTime delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:5.0 options:0 animations:^{
        self.contentView.y = y;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showContentViewByFromLeftBounces{
    CGFloat x = self.contentView.x;
    self.contentView.x = self.contentView.x - kScreenWidth;
    [UIView animateWithDuration:kAnimateTime delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:5.0 options:0 animations:^{
        self.contentView.x = x;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showContentViewByFromRightBounces{
    CGFloat x = self.contentView.x;
    self.contentView.x = self.contentView.x + kScreenWidth;
    [UIView animateWithDuration:kAnimateTime delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:5.0 options:0 animations:^{
        self.contentView.x = x;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showContentViewByFromBottomBounces{
    CGFloat y = self.contentView.y;
    self.contentView.y = self.contentView.y + kScreenHeight;
    [UIView animateWithDuration:kAnimateTime delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:5.0 options:0 animations:^{
        self.contentView.y = y;
    } completion:^(BOOL finished) {
        
    }];
}


@end

