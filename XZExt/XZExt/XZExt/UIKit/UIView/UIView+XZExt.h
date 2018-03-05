//
//  UIView+XZExt.h
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XZExt)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

//添加单击手势
- (UITapGestureRecognizer *)addTapGestureRecognizerWithTarget:(id)target action:(SEL)action;

//摇动或者拖拽UIPanGestureRecognizer (拖动)
- (UIPanGestureRecognizer *)addPanGestureRecognizerWithTarget:(id)target action:(SEL)action;

//擦碰UISwipeGestureRecognizer (以任意方向)
- (UISwipeGestureRecognizer *)addSwipeGestureRecognizerWithTarget:(id)target action:(SEL)action;

//旋转UIRotationGestureRecognizer (手指朝相反方向移动)
- (UIRotationGestureRecognizer *)addRotationGestureRecognizerWithTarget:(id)target action:(SEL)action;

//长按UILongPressGestureRecognizer (长按)
- (UILongPressGestureRecognizer *)addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)action;

//向里或向外捏UIPinchGestureRecognizer (用于缩放)
- (UIPinchGestureRecognizer *)addPinchGestureRecognizerWithTarget:(id)target action:(SEL)action;

//删除所有子视图
- (void)removeAllSubivews;

//是否在屏幕中，即是否在可显示层级中（当view与屏幕frame有交集且hidden为NO，alpha不为0时等一切可视情况（被完全遮盖也视作可视情况）为YES，其他为NO）
@property (nonatomic ,assign ,readonly,getter=isInScreen) BOOL inScreen;

//获取当前view所属控制器
@property (nonatomic, strong, readonly) UIViewController *viewController;

//左右摇晃动画
- (void)addShakeAnimationWithDuration:(NSTimeInterval)duration;

//左右摇晃动画
- (void)addShakeAnimation;

//点赞动画
- (void)addLikeAnimation;

@end
