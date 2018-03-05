//
//  UIAlertView+XZExt.m
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "UIAlertView+XZExt.h"

#import <objc/runtime.h>

@interface AlertWrapper : NSObject

@property (copy) void(^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@end

@implementation AlertWrapper

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.completionBlock) {
        self.completionBlock(alertView, buttonIndex);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    if (self.completionBlock) {
        self.completionBlock(alertView, alertView.cancelButtonIndex);
    }
}

@end

static const char kAlertWrapper;
@implementation UIAlertView (XZExt)

- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion {
    AlertWrapper *alertWrapper = [[AlertWrapper alloc] init];
    alertWrapper.completionBlock = completion;
    self.delegate = alertWrapper;
    
    objc_setAssociatedObject(self, &kAlertWrapper, alertWrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self show];
}

@end
