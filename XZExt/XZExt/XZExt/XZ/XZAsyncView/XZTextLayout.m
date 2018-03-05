//
//  XZTextLayout.m
//  XZExt
//
//  Created by Zeasn on 2018/3/4.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "XZTextLayout.h"

#import "YYKit.h"

#import "UIColor+XZExt.h"

@implementation XZTextLayout

+ (instancetype)createWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color fitWithSize:(CGSize) size lineHeight:(CGFloat)lineHeight{
    if (text == nil) {
        text = @" ";
    }
    if (size.height < font.pointSize + 3) {
        size.height = font.pointSize + 3;
    }
    
    XZTextLayout *  textLayout = [XZTextLayout new];
    NSMutableAttributedString * atts = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName:color , NSFontAttributeName : font}];
    textLayout.attributedText = atts;
    atts.lineSpacing = lineHeight;
    YYTextContainer *container = [YYTextContainer containerWithSize:size];
    container.truncationType = YYTextTruncationTypeEnd;
    YYTextLayout * yyTextLayout = [YYTextLayout layoutWithContainer:container text:atts];
    textLayout.textLayout = yyTextLayout;
    textLayout.size = yyTextLayout.textBoundingSize;
    
    if (CGSizeEqualToSize(CGSizeZero, textLayout.size)) {
        textLayout.size = [atts boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;
    }
    
    return textLayout;
}

+ (instancetype)createWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color fitWithSize:(CGSize) size{
    if (text == nil) {
        text = @" ";
    }
    if (size.height < font.pointSize + 3) {
        size.height = font.pointSize + 3;
    }
    XZTextLayout *  textLayout = [XZTextLayout new];
    NSMutableAttributedString * atts = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName:color , NSFontAttributeName : font}];
    textLayout.attributedText = atts;
    
    YYTextContainer *container = [YYTextContainer containerWithSize:size];
    container.truncationType = YYTextTruncationTypeEnd;
    YYTextLayout * yyTextLayout = [YYTextLayout layoutWithContainer:container text:atts];
    textLayout.textLayout = yyTextLayout;
    textLayout.size = yyTextLayout.textBoundingSize;
    if (CGSizeEqualToSize(CGSizeZero, textLayout.size)) {
        textLayout.size = [atts boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;
    }
    return textLayout;
}

+ (instancetype)createWithTextAttributes:(NSAttributedString *)textAtt fitWithSize:(CGSize)size contentInsets:(UIEdgeInsets)insets{
    
    XZTextLayout *  textLayout = [XZTextLayout new];
    
    YYTextContainer *container = [YYTextContainer containerWithSize:size];
    container.insets = insets;
    container.truncationType = YYTextTruncationTypeEnd;
    YYTextLayout * yyTextLayout = [YYTextLayout layoutWithContainer:container text:textAtt];
    textLayout.textLayout = yyTextLayout;
    textLayout.attributedText = textAtt;
    textLayout.size = yyTextLayout.textBoundingSize;
    if (CGSizeEqualToSize(CGSizeZero, textLayout.size)) {
        textLayout.size = [textAtt boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;
    }
    return textLayout;
}


+ (instancetype)createWithTextAttributes:(NSAttributedString *)textAtt fitWithSize:(CGSize)size{
    return [self createWithTextAttributes:textAtt fitWithSize:size contentInsets:UIEdgeInsetsZero];
}

+ (instancetype)createWithText:(NSString *)text fontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithSize:(CGSize) size{
    return [self createWithText:text font:[UIFont systemFontOfSize:fontSize] textColor:[UIColor colorWithHexString:hex] fitWithSize:size];
}

+ (instancetype)createWithText:(NSString *)text boldFontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithSize:(CGSize) size{
    return [self createWithText:text font:[UIFont boldSystemFontOfSize:fontSize] textColor:[UIColor colorWithHexString:hex] fitWithSize:size];
}

+ (instancetype)createWithText:(NSString *)text fontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithWidth:(CGFloat) width{
    return [self createWithText:text font:[UIFont systemFontOfSize:fontSize] textColor:[UIColor colorWithHexString:hex] fitWithSize:CGSizeMake(width, INTMAX_MAX)];
}

+ (instancetype)createWithText:(NSString *)text fontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithHeight:(CGFloat) height{
    return [self createWithText:text font:[UIFont systemFontOfSize:fontSize] textColor:[UIColor colorWithHexString:hex] fitWithSize:CGSizeMake(INTMAX_MAX, height)];
}

+ (instancetype)createWithText:(NSString *)text font:(UIFont *)font hexColor:(NSString *)hex fitWithHeight:(CGFloat) height{
    return [self createWithText:text font:font textColor:[UIColor colorWithHexString:hex] fitWithSize:CGSizeMake(INTMAX_MAX, height)];
    
}

+ (instancetype)createWithText:(NSString *)text boldFontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithHeight:(CGFloat) height{
    return [self createWithText:text font:[UIFont boldSystemFontOfSize:fontSize] textColor:[UIColor colorWithHexString:hex] fitWithSize:CGSizeMake(INTMAX_MAX, height)];
}

+ (instancetype)createWithText:(NSString *)text boldFontSize:(CGFloat)fontSize hexColor:(NSString *)hex fitWithWidth:(CGFloat) width{
    return [self createWithText:text font:[UIFont boldSystemFontOfSize:fontSize] textColor:[UIColor colorWithHexString:hex] fitWithSize:CGSizeMake(width, INTMAX_MAX)];
}

@end
