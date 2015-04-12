//
//  ProgressButton.m
//  03-下载
//
//  Created by teacher on 15/3/29.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "ProgressButton.h"

@implementation ProgressButton

- (void)setProgress:(float)progress {
    _progress = progress;
    
    // 设置百分比
    [self setTitle:[NSString stringWithFormat:@"%.02f%%", progress * 100] forState:UIControlStateNormal];
    
    [self setNeedsDisplay];
}

// 提问：rect 是 self.bounds
- (void)drawRect:(CGRect)rect {

    /**
     参数
     1. 圆心
     2. 半径
     3. 起始角度
     4. 完成角度
     5. 是否顺时针
     */
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat r = (MIN(rect.size.width, rect.size.height) - self.lineWidth) * 0.5;
    CGFloat start = - M_PI_2;
    CGFloat end = self.progress * 2 * M_PI + start;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:start endAngle:end clockwise:YES];
    
    path.lineWidth = self.lineWidth;
    path.lineCapStyle = kCGLineCapRound;
    
    [self.lineColor setStroke];
    
    [path stroke];
}

@end
