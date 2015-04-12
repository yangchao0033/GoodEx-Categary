//
//  NSString+Extension.m
//  黑马5期微博
//
//  Created by teacher on 15/4/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    return [self appendWithPath:path];
}

/**
 *  追加缓存目录
 */
- (NSString *)appendCacheDir{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    return [self appendWithPath:path];
}

/**
 *  追加临时目录
 */
- (NSString *)appendTempDir{
    NSString *path = NSTemporaryDirectory();
    return [self appendWithPath:path];
}

// 在传入的路径后拼接当前的字符串
- (NSString *)appendWithPath:(NSString *)path{
    return [path stringByAppendingPathComponent:self];
}

@end
