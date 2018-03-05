//
//  UIImagePickerController+XZExt.h
//  ZNTest
//
//  Created by Zeasn on 2018/3/1.
//  Copyright © 2018年 Zeasn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImagePickerController (XZExt)

+ (UIImagePickerController *)imagePickerControllerWithSourceType:(UIImagePickerControllerSourceType)sourceType;

//图库是否可用
+ (BOOL)isAvailablePhotoLibrary;

//相机是否可用
+ (BOOL)isAvailableCamera;

//是否支持拍照权限
+ (BOOL)isSupportTakingPhotos;

//是否支持图库权限
+ (BOOL)isSupportPickPhotosFromPhotoLibrary;

//是否支持媒体类型 (mediaType 媒体类型) (sourceType 媒体类型)
+ (BOOL)isSupportsMedia:(NSString *)mediaType
                sourceType:(UIImagePickerControllerSourceType)sourceType;

@end
