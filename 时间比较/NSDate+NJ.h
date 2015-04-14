//
//  NSDate+NJ.h
//  传智微博
//
//  Created by 李南江 on 14-7-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NJ)
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;
@end
#pragma mark Example
/*
// 这个是经常变的，需要在这里重写
- (NSString *)created_at
{
    // 1.将服务器返回的时间, 转换为NSDate
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    formatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    NSDate *createdDate = [formatter dateFromString:_created_at];
    
    if ([createdDate isThisYear]) {
        // 今年
        if ([createdDate isToday]) {
            // 今天
            NSDateComponents *cmps =[createdDate deltaWithNow];
            if (cmps.hour >= 1) {
                // 其它小时
                return [NSString stringWithFormat:@"%tu小时前", cmps.hour];
            }else if (cmps.minute > 1){
                // 1小时以内
                return [NSString stringWithFormat:@"%tu分钟前", cmps.minute];
            }else
            {
                // 1分钟以内
                return @"刚刚";
            }
            
        }else if ([createdDate isYesterday]){
            // 昨天
            formatter.dateFormat = @"昨天 HH时:mm分";
            return [formatter stringFromDate:createdDate];
        }else{
            // 其它天
            formatter.dateFormat = @"MM月dd日 HH时:mm分";
            return [formatter stringFromDate:createdDate];
        }
    }else
    {
        // 非今年
        formatter.dateFormat = @"yy年MM月dd日 HH时:mm分";
        return [formatter stringFromDate:createdDate];
    }
}
*/