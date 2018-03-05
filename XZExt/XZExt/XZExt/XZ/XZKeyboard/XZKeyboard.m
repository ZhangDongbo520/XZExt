//
//  XZKeyboard.m
//  XZExt
//
//  Created by Zeasn on 2018/3/4.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "XZKeyboard.h"

#import "NSObject+Dealloc.h"

@interface XZKeyboard()

@property (nonatomic, assign) CGFloat keyBoardHeight;
@property (nonatomic, assign, getter = isShowKeyboard) BOOL showKeyboard;
@property (nonatomic, copy) KeyboardBlock keyboardWillShowBlock;
@property (nonatomic, copy) KeyboardBlock keyboardWillHideBlock;
@property (nonatomic, strong) NSMutableDictionary *keyboardWillShowBlockDic;
@property (nonatomic, strong) NSMutableDictionary *keyboardWillHideBlockDic;

@end

@implementation XZKeyboard

+ (XZKeyboard *)getInstance {
    static XZKeyboard * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [XZKeyboard new];
    });
    return instance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initConfigs];
    }
    return self;
}

- (void)initConfigs {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    self.keyboardWillHideBlockDic = [NSMutableDictionary new];
    self.keyboardWillShowBlockDic = [NSMutableDictionary new];
}

- (void)keyboardWillShow:(NSNotification *)notify {
    NSDictionary * info = notify.userInfo;
    CGFloat height = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    UIViewAnimationCurve curve ;
    [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&curve];
    CGFloat addHeight = height - self.keyBoardHeight;
    self.keyBoardHeight = height;
    [UIView beginAnimations:@"KeyboardShow" context:nil];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationDuration:duration];
    if (self.keyboardWillShowBlock) {
        self.keyboardWillShowBlock(addHeight, height , duration);
    }
    for (KeyboardBlock block in self.keyboardWillShowBlockDic.allValues) {
        if (block) {
            block(addHeight,height,duration);
        }
    }
    [UIView commitAnimations];
}

- (void)keyboardDidShow:(NSNotification *)notify{
    self.showKeyboard = true;
}

- (void)keyboardWillHide:(NSNotification *)notify{
    self.showKeyboard = false;
    NSDictionary * info = notify.userInfo;
    CGFloat height = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat addHeight = -height;
    self.keyBoardHeight = 0;
    UIViewAnimationCurve curve ;
    [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&curve];
    [UIView beginAnimations:@"keyboardWillHide" context:nil];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationDuration:duration];
    if (self.keyboardWillHideBlock) {
        self.keyboardWillHideBlock(addHeight, height , duration);
    }
    for (KeyboardBlock block in self.keyboardWillHideBlockDic.allValues) {
        if (block) {
            block(addHeight,height,duration);
        }
    }
    [UIView commitAnimations];
}

- (void)addKeyboardWillHideBlock:(KeyboardBlock)block {
    self.keyboardWillHideBlock = nil;
    self.keyboardWillHideBlock = block;
}

- (void)addKeyboardWillShowBlock:(KeyboardBlock)block {
    self.keyboardWillShowBlock = nil;
    self.keyboardWillShowBlock = block;
}

- (void)addKeyboardWillShowBlockWithTarget:(id)target  block:(KeyboardBlock)block {
    NSString * key = [NSString stringWithFormat:@"%ld",(long)target];
    [self.keyboardWillShowBlockDic setValue:block forKey:key];
    __weak typeof(self) weakSelf = self;
    [target addDeallocBlock:^{
        [weakSelf removeBlockWithKey:key];
    }];
}

- (void)addKeyboardWillHideBlockWithTarget:(id)target  block:(KeyboardBlock)block {
    NSString * key = [NSString stringWithFormat:@"%ld",(long)target];
    [self.keyboardWillHideBlockDic setValue:block forKey:key];
}

- (void)removeBlock {
    self.keyboardWillShowBlock = nil;
    self.keyboardWillHideBlock = nil;
}

- (void)removeBlockWithTarget:(id)target {
    NSString * key = [NSString stringWithFormat:@"%ld",(long)target];
    [self removeBlockWithKey:key];
}

- (void)removeBlockWithKey:(NSString *)key {
    [self.keyboardWillHideBlockDic removeObjectForKey:key];
    [self.keyboardWillShowBlockDic removeObjectForKey:key];
}

@end
