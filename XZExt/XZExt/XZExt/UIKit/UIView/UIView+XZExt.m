//
//  UIView+XZExt.m
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "UIView+XZExt.h"

@implementation UIView (XZExt)

#pragma mark - set方法
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setLeft:(CGFloat)left {
    CGRect fra = self.frame;
    fra.origin.x = left;
    self.frame = fra;
}

- (void)setTop:(CGFloat)top {
    CGRect fra = self.frame;
    fra.origin.y = top;
    self.frame = fra;
}

- (void)setRight:(CGFloat)right {
    CGRect fra = self.frame;
    fra.origin.x = right - self.frame.size.width;
    self.frame = fra;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect fra = self.frame;
    fra.origin.y = bottom - self.frame.size.height;
    self.frame = fra;
}

#pragma mark - get方法
- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGSize)size {
    return self.frame.size;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

//添加单击手势 它自动帮你交互属性设置为YES
- (UITapGestureRecognizer *)addTapGestureRecognizerWithTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
    return tap;
}

//摇动或者拖拽UIPanGestureRecognizer (拖动)
- (UIPanGestureRecognizer *)addPanGestureRecognizerWithTarget:(id)target action:(SEL)action{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:pan];
    return pan;
}

//擦碰UISwipeGestureRecognizer (以任意方向)
- (UISwipeGestureRecognizer *)addSwipeGestureRecognizerWithTarget:(id)target action:(SEL)action{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:swipe];
    return swipe;
}

//旋转UIRotationGestureRecognizer (手指朝相反方向移动)
- (UIRotationGestureRecognizer *)addRotationGestureRecognizerWithTarget:(id)target action:(SEL)action{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:rotation];
    return rotation;
}

//长按UILongPressGestureRecognizer (长按)
- (UILongPressGestureRecognizer *)addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)action{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:longPress];
    return longPress;
}

//向里或向外捏UIPinchGestureRecognizer (用于缩放)
- (UIPinchGestureRecognizer *)addPinchGestureRecognizerWithTarget:(id)target action:(SEL)action{
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:pinch];
    return pinch;
}

//删除所有子视图
- (void)removeAllSubivews{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (BOOL)isInScreen {
    SEL selec = NSSelectorFromString(@"_isInVisibleHierarchy");
    NSMethodSignature * sign = [[UIView class] instanceMethodSignatureForSelector:selec];
    NSInvocation * inv = [NSInvocation invocationWithMethodSignature:sign];
    inv.target = self;
    inv.selector = selec;
    
    BOOL visible = NO;
    [inv invoke];
    [inv getReturnValue:&visible];
    return visible;
}

- (UIViewController*)viewController {
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

//左右摇晃动画
- (void)addShakeAnimationWithDuration:(NSTimeInterval)duration {
    
}

//左右摇晃动画
- (void)addShakeAnimation {
    [self addShakeAnimationWithDuration:0.08f];
}

//点赞动画
- (void)addLikeAnimation {
    CAKeyframeAnimation *praiseAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    praiseAnimation.values = @[@(0.1),@(1.0),@(1.5)];
    praiseAnimation.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    praiseAnimation.calculationMode = kCAAnimationLinear;
    praiseAnimation.removedOnCompletion = YES;
    [self.layer addAnimation:praiseAnimation forKey:@"praiseAnimation"];
}

@end
