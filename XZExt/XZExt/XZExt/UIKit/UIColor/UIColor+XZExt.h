//
//  UIColor+XZExt.h
//  ZNTest
//
//  Created by Zeasn on 2018/3/1.
//  Copyright © 2018年 Zeasn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XZExt)

// 随机颜色
+ (UIColor *)randomColor;

+ (UIColor *)rgbaColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)rgbColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

//从十六进制字符串获取颜色         支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)color;

@end
