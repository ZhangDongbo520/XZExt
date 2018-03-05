//
//  XZPopView.h
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    XZPopStyleNone,                          // 无动画
    XZPopStyleFade,                          // 淡入
    XZPopStyleScale,                         // 从小到大弹出
    XZPopStyleFromTop,                    // 从上弹下来
    XZPopStyleFromLeft,                    // 从左弹出来
    XZPopStyleFromRight,                  // 从右弹出来
    XZPopStyleFromBottom,               // 从下弹上来
    XZPopStyleScaleBounces,             // 从小到大弹出 带弹性效果
    XZPopStyleFromTopBounces,        // 从上弹下来 带弹性效果
    XZPopStyleFromLeftBounces,        // 从左弹出来 带弹性效果
    XZPopStyleFromRightBounces,      // 从右弹出来 带弹性效果
    XZPopStyleFromBottomBounces    // 从下弹上来 带弹性效果
}XZPopStyle;

@protocol XZPopViewDelegate <NSObject>



@end

@interface XZPopView : UIView

+ (XZPopView *)popWithContentView:(UIView *)contentView inView:(UIView *)inView popStyle:(XZPopStyle)popStyle setContentViewFrameWithBlock:(void (^)(UIView *contentView,UIView *superView))block;
+ (XZPopView *)popWithContentView:(UIView *)contentView inView:(UIView *)inView popStyle:(XZPopStyle)popStyle tapBackgroundClose:(BOOL)close setContentViewFrameWithBlock:(void (^)(UIView *contentView,UIView *superView))block;
+ (XZPopView *)popWithContentView:(UIView *)contentView inView:(UIView *)inView popStyle:(XZPopStyle)popStyle tapBackgroundClose:(BOOL)close backgroundAlpha:(CGFloat)backgroundAlpha delegate:(id<XZPopViewDelegate> __nullable)delegate setContentViewFrameWithBlock:(void (^)(UIView *contentView,UIView *superView))block;

+ (void)closeWithRootView:(UIView *)rootView animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
