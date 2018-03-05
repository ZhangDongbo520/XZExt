//
//  UIImagePickerController+XZExt.m
//  ZNTest
//
//  Created by Zeasn on 2018/3/1.
//  Copyright © 2018年 Zeasn. All rights reserved.
//

#import "UIImagePickerController+XZExt.h"

#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@implementation UIImagePickerController (XZExt)


+ (UIImagePickerController *)imagePickerControllerWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    UIImagePickerController *controller = [[UIImagePickerController alloc]init];
    [controller setSourceType:sourceType];
    [controller setMediaTypes:@[(NSString *)kUTTypeImage]];
    return controller;
}

+ (BOOL)isAvailablePhotoLibrary {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

+ (BOOL)isAvailableCamera {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL)isSupportTakingPhotos {
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        return NO;
    }else {
        return YES;
    }
}

+ (BOOL)isSupportPickPhotosFromPhotoLibrary {
    return [self isSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

+ (BOOL)isSupportsMedia:(NSString *)mediaType sourceType:(UIImagePickerControllerSourceType)sourceType {
    __block BOOL result = NO;
    if ([mediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:mediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

@end
