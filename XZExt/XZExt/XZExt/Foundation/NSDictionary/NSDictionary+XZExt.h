//
//  NSDictionary+XZExt.h
//  ZNTest
//
//  Created by Zeasn on 2018/3/1.
//  Copyright © 2018年 Zeasn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSDictionary (XZExt)

+ (nullable NSDictionary *)dictionaryWithPlistData:(NSData *)plist;

+ (nullable NSDictionary *)dictionaryWithPlistString:(NSString *)plist;

@end
NS_ASSUME_NONNULL_END
