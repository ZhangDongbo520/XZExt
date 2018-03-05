//
//  UIApplication+XZExt.h
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (XZExt)

// "Documents" 路径
@property (nonatomic, readonly) NSURL *documentsURL;
@property (nonatomic, readonly) NSString *documentsPath;

// "Caches" 路径
@property (nonatomic, readonly) NSURL *cachesURL;
@property (nonatomic, readonly) NSString *cachesPath;

// "Library" 路径
@property (nonatomic, readonly) NSURL *libraryURL;
@property (nonatomic, readonly) NSString *libraryPath;

// 应用的 Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString *appBundleName;

// 应用的 Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nullable, nonatomic, readonly) NSString *appBundleID;

// 应用的版本号.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString *appVersion;

// 应用的构建号. e.g. "123"
@property (nullable, nonatomic, readonly) NSString *appBuildVersion;

@end

NS_ASSUME_NONNULL_END
