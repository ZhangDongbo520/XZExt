//
//  XZTextLayout.h
//  XZExt
//
//  Created by Zeasn on 2018/3/4.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YYTextLayout.h"

@interface XZTextLayout : NSObject

@property(nonatomic , strong) YYTextLayout * textLayout;
@property(nonatomic , assign) CGSize size;
@property(nonatomic , strong) NSAttributedString * attributedText;


+ (instancetype)createWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color fitWithSize:(CGSize) size;

+ (instancetype)createWithText:(NSString *)text fontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithSize:(CGSize) size;

+ (instancetype)createWithText:(NSString *)text boldFontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithSize:(CGSize) size;

+ (instancetype)createWithText:(NSString *)text fontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithWidth:(CGFloat) width;

+ (instancetype)createWithText:(NSString *)text boldFontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithHeight:(CGFloat) height;

+ (instancetype)createWithText:(NSString *)text fontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithHeight:(CGFloat) height;

+ (instancetype)createWithText:(NSString *)text boldFontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithWidth:(CGFloat) width;

+ (instancetype)createWithTextAttributes:(NSAttributedString *)textAtt fitWithSize:(CGSize)size;

+ (instancetype)createWithTextAttributes:(NSAttributedString *)textAtt fitWithSize:(CGSize)size contentInsets:(UIEdgeInsets)insets;

+ (instancetype)createWithText:(NSString *)text font:(UIFont *)font hexColor:(NSString *)hex fitWithHeight:(CGFloat) height;

+ (instancetype)createWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color fitWithSize:(CGSize) size lineHeight:(CGFloat)lineHeight;

@end
