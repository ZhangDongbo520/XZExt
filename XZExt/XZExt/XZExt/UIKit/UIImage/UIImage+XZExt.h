//
//  UIImage+XZExt.h
//  ZNTest
//
//  Created by Zeasn on 2018/3/1.
//  Copyright © 2018年 Zeasn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZExt)

+ (UIImage *)wb_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)fixOrientation:(UIImage *)aImage;

@end
