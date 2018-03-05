//
//  NSTimer+XZExt.h
//  XZExt
//
//  Created by Zeasn on 2018/3/2.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (XZExt)

// 注意点：自动加入当前循环
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

// 注意点：需要手动加入到循环中
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

// 暂停NSTimer
- (void)pauseTimer;

// 开始NSTimer
- (void)resumeTimer;

// 延迟开始NSTimer
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
