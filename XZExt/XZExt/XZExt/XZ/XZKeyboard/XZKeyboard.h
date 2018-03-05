//
//  XZKeyboard.h
//  XZExt
//
//  Created by Zeasn on 2018/3/4.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KeyboardBlock)(CGFloat addHeight ,CGFloat height , CGFloat duration);
@interface XZKeyboard : NSObject

+ (XZKeyboard *)getInstance;

- (void)addKeyboardWillHideBlock:(KeyboardBlock)block;
- (void)addKeyboardWillShowBlock:(KeyboardBlock)block;
- (void)removeBlock;

//自动移除
- (void)addKeyboardWillShowBlockWithTarget:(id)target  block:(KeyboardBlock)block;
//自动移除
- (void)addKeyboardWillHideBlockWithTarget:(id)target  block:(KeyboardBlock)block;
- (void)removeBlockWithTarget:(id)target;

@end
