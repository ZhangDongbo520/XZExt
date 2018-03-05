//
//  NSArray+XZExt.m
//  ZNTest
//
//  Created by Zeasn on 2018/3/1.
//  Copyright © 2018年 Zeasn. All rights reserved.
//

#import "NSArray+XZExt.h"

@implementation NSArray (XZExt)

+ (NSArray *)arrayFromPlistFileName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

+ (nullable NSArray *)arrayWithPlistData:(NSData *)data {
    if (!data) return nil;
    NSArray *array = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:NULL error:NULL];
    if ([array isKindOfClass:[NSArray class]]) return array;
    return nil;
}

+ (nullable NSArray *)arrayWithPlistString:(NSString *)string {
    if (!string) return nil;
    NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [self arrayWithPlistData:data];
}

- (NSArray *)reversedArray {
    NSArray * reversedArray = [[self reverseObjectEnumerator] allObjects];
    return reversedArray;
}

- (NSArray *)arraySorting:(NSString *)parameters ascending:(BOOL)ascending {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:parameters ascending:ascending];
    NSMutableArray *descriptors = [[NSMutableArray alloc] initWithObjects:&sortDescriptor count:1];
    NSArray *sortArray = [self sortedArrayUsingDescriptors:descriptors];
    return sortArray;
}

@end

@implementation NSMutableArray (XZExt)

+ (nullable NSMutableArray *)arrayWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    NSMutableArray *array = [NSPropertyListSerialization propertyListWithData:plist options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    if ([array isKindOfClass:[NSMutableArray class]]) return array;
    return nil;
}

+ (nullable NSMutableArray *)arrayWithPlistString:(NSString *)plist {
    if (!plist) return nil;
    NSData* data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    return [self arrayWithPlistData:data];
}

- (void)reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

@end
