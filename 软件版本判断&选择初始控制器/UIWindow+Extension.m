//
//  UIWindow+Extension.m
//  黑马5期微博
//
//  Created by teacher on 15/4/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "UIWindow+Extension.h"

@implementation UIWindow (Extension)

- (void)chooseRootViewController
{
    // 判断显示新特性还是欢迎界面
    // 3.判断是否是第一次使用软件, 或者是不是升级了软件
    // 3.1获取当前软件版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    // 3.2获取沙盒的软件版本号
    NSUserDefaults *dafault = [NSUserDefaults standardUserDefaults];
    NSString *sandboxVersion = [dafault objectForKey:@"xxoo"];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 3.3比较两个版本号
    if ([currentVersion compare:sandboxVersion] == NSOrderedDescending) {
        // 显示新特性
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"HMNewfeatureController" bundle:nil];
        UIViewController *newVc = sb.instantiateInitialViewController;
        window.rootViewController = newVc;
        
        // 保存当前的软件版本号
        [dafault setObject:currentVersion forKey:@"xxoo"];
        [dafault synchronize];
        
    }else{
        // 显示欢迎界面
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"HMWelcomeController" bundle:nil];
        UIViewController *welVc = sb.instantiateInitialViewController;
        window.rootViewController = welVc;
    }

}
@end
