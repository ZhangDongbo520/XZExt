//
//  XZAsyncLabel.m
//  XZExt
//
//  Created by Zeasn on 2018/3/4.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "XZAsyncLabel.h"

#import "UIView+XZExt.h"

@interface XZAsyncLabel()

@property (nonatomic, weak)  XZTextLayout *xzTextLayout;

@end

@implementation XZAsyncLabel

+ (instancetype) create {
    XZAsyncLabel * label = [self new];
    label.displaysAsynchronously = true;
    label.ignoreCommonProperties = true;
    return label;
}

- (void)setTextWithTextLayout:(XZTextLayout *)textLayout {
    if (self.xzTextLayout != textLayout ) {
        self.xzTextLayout = textLayout;
        self.ignoreCommonProperties = textLayout.textLayout.textBoundingSize.width > 0;
        if (self.ignoreCommonProperties) {
            [self setTextLayout:textLayout.textLayout];
        }else {
            [self setAttributedText:textLayout.attributedText];
        }
        self.size = textLayout.size;
    }
}

- (void)setDisplaysAsynchronously:(BOOL)displaysAsynchronously {
    if (self.displaysAsynchronously != displaysAsynchronously) {
        [super setDisplaysAsynchronously:displaysAsynchronously];
    }
}

- (void)setIgnoreCommonProperties:(BOOL)ignoreCommonProperties {
    if ([super ignoreCommonProperties] != ignoreCommonProperties) {
        [super setIgnoreCommonProperties:ignoreCommonProperties];
    }
}

@end
