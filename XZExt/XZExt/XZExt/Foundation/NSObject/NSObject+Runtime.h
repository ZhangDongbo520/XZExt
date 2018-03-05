//
//  NSObject+Runtime.h
//  ZNTest
//
//  Created by Zeasn on 2017/7/7.
//  Copyright © 2017年 Zeasn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

// 属性列表
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;
// 格式化之后的属性列表
+ (NSArray *)propertiesWithCodeFormat;


// 成员变量列表
- (NSArray *)ivarInfo;
+ (NSArray *)ivarInfo;


// 对象方法列表
- (NSArray*)instanceMethodList;
+ (NSArray*)instanceMethodList;
// 类方法列表
+ (NSArray*)classMethodList;


// 协议列表
- (NSDictionary *)protocolList;
+ (NSDictionary *)protocolList;


// 交换实例方法
+ (void)SwizzlingInstanceMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;
// 交换类方法
+ (void)SwizzlingClassMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;


// 添加方法
+ (void)addMethodWithSEL:(SEL)methodSEL methodIMP:(SEL)methodIMP;

@end
