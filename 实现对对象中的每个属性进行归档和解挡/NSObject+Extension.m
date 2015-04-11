//
//  NSObject+Extension.m
//  06-运行时的应用-获得类的所有成员变量
//
//  Created by teacher on 15/3/13.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

/**
 * 从文件中读取对象时会调用这个方法（开发者需要在这个方法中说明哪些属性需要取出来）
 */
- (void)decode:(NSCoder *)decoder
{
    Class c = self.class;
    
    while (c && c != [NSObject class]) {
        
        // 用来存储成员变量的数量
        unsigned int outCount = 0;
        
        // 获得Dog类的所有成员变量
        Ivar *ivars = class_copyIvarList(c, &outCount);
        
        // 遍历所有的成员变量
        for (int i = 0; i<outCount; i++) {
            // 取出i位置对应的成员变量，除去变量的下划线
            Ivar ivar = ivars[i];
            
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            // 判断在子类是否实现了这个方法，如果发现需要忽略的数组中包含对象中的属性，就不需要进行归档。
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) continue;
            }
            
            // 获得key对应的值
            id value = [decoder decodeObjectForKey:key];
            
            // 设置到成员变量上
            [self setValue:value forKeyPath:key];
        }
        
        free(ivars);
        
        // 获得父类
        c = [c superclass];
    }
}

/**
 * 将对象写入文件时会调用这个方法（开发者需要在这个方法中说明需要存储哪些属性）
 */
- (void)encode:(NSCoder *)encoder
{
    Class c = self.class;
    
    while (c && c != [NSObject class]) {
        // 用来存储成员变量的数量
        unsigned int outCount = 0;
        
        // 获得Dog类的所有成员变量
        Ivar *ivars = class_copyIvarList(c, &outCount);
        
        // 遍历所有的成员变量
        for (int i = 0; i<outCount; i++) {
            // 取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) continue;
            }
            
            // 通过key获得对应成员变量的值
            id value = [self valueForKeyPath:key];
            
            [encoder encodeObject:value forKey:key];
        }
        
        free(ivars);
        
        c = [c superclass];
    }
}
@end
