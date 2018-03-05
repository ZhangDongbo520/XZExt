//
//  XZAsyncLabel.h
//  XZExt
//
//  Created by Zeasn on 2018/3/4.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YYKit.h"

#import "XZTextLayout.h"

@interface XZAsyncLabel : YYLabel

//务必用create 来构造对象
+ (instancetype) create;

//通过设置这个文本布局 显示内容
- (void)setTextWithTextLayout:(XZTextLayout *)textLayout;

@end
