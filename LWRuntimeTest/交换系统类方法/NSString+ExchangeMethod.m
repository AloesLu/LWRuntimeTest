//
//  NSString+ExchangeMethod.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/9/30.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "NSString+ExchangeMethod.h"
#import <objc/runtime.h>

@implementation NSString (ExchangeMethod)

// 加载分类到内存的时候调用
+ (void)load
{
    // 获取imageWithName方法地址
    Method description = class_getClassMethod(self, @selector(description));
//    Method description = class_getInstanceMethod(self, @selector(description));
    
    // 获取imageWithName方法地址
    Method mydescription = class_getClassMethod(self, @selector(mydescription));
//    Method mydescription1 = class_getInstanceMethod(self, @selector(mydescription1));
    
    // 交换方法地址，相当于交换实现方式
    method_exchangeImplementations(mydescription, description);
//    method_exchangeImplementations(mydescription1, description);
    
    [super load];
}

+ (NSString *)mydescription
{
    return @"类方法交换了吗？";
}
- (NSString *)mydescription1
{
    return @"实例方法交换了吗？";
}
@end
