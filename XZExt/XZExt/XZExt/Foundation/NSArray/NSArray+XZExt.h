//
//  NSArray+XZExt.h
//  ZNTest
//
//  Created by Zeasn on 2018/3/1.
//  Copyright © 2018年 Zeasn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSArray (XZExt)

//通过Plist名取到Plist文件中的数组
+ (NSArray *)arrayFromPlistFileName:(NSString *)name;

+ (nullable NSArray *)arrayWithPlistData:(NSData *)data;

+ (nullable NSArray *)arrayWithPlistString:(NSString *)string;

- (NSArray *)reversedArray;

- (NSArray *)arraySorting:(NSString *)parameters ascending:(BOOL)ascending;

@end

@interface NSMutableArray (XZExt)

+ (nullable NSMutableArray *)arrayWithPlistData:(NSData *)plist;

+ (nullable NSMutableArray *)arrayWithPlistString:(NSString *)plist;

- (void)reverse;

@end
NS_ASSUME_NONNULL_END
