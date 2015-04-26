//
//  CLLocationManager+estimateAuth.m
//  UpdatingLocation
//
//  Created by jiasongkai on 15/4/26.
//  Copyright (c) 2015年 jiasongkai. All rights reserved.
//

#import "CLLocationManager+estimateAuth.h"
@implementation CLLocationManager (estimateAuth)

- (void)estimateAuthCompletion:(void(^)())completion
{
    self.completion = completion;
    self.delegate = self;
    if ([[UIDevice currentDevice] systemVersion].doubleValue >= 8.0) {
        [self requestAlwaysAuthorization];
    }else{
        if (completion) {
            self.completion();
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"等待用户授权");
    }else if (status == kCLAuthorizationStatusAuthorizedAlways ||
              status == kCLAuthorizationStatusAuthorizedWhenInUse)

    {
        NSLog(@"授权成功");
        if (self.completion) {

            self.completion();
        }

    }else
    {
        NSLog(@"授权失败");
    }
}

static const char key = 'k';

- (void)setCompletion:(void (^)())completion
{
    objc_setAssociatedObject(self, &key, completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)())completion
{
    return objc_getAssociatedObject(self, &key);
}
@end
