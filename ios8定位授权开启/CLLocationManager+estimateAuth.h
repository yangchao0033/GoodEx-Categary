//
//  CLLocationManager+estimateAuth.h
//  UpdatingLocation
//
//  Created by jiasongkai on 15/4/26.
//  Copyright (c) 2015年 jiasongkai. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface CLLocationManager (estimateAuth) <CLLocationManagerDelegate>

- (void)estimateAuthCompletion:(void(^)())completion;

@property (nonatomic, copy) void(^completion)();

@end
