//
//  ProgressButton.h
//  03-下载
//
//  Created by teacher on 15/3/29.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressButton : UIButton

@property (nonatomic, assign) float progress;

/// 线宽
@property (nonatomic, assign) CGFloat lineWidth;
/// 颜色
@property (nonatomic, strong) UIColor *lineColor;

@end
