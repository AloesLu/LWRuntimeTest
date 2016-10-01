//
//  UILabel+ExchangeMethod.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/9/30.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "UILabel+ExchangeMethod.h"
#import <objc/runtime.h>
// 交换方法
static inline void af_swizzleSelector(Class theClass, SEL originalSelector, SEL swizzledSelector) {
    // 从一个类中获取类的原始方法
    Method originalMethod = class_getInstanceMethod(theClass, originalSelector);
    
    // 从一个类中获取类的交换方法 （注：使用此方法前，需要将交换方法添加到这个类中）
    Method swizzledMethod = class_getInstanceMethod(theClass, swizzledSelector);
    
    // 交换方法的实现
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

static inline BOOL af_addMethod(Class theClass, SEL selector, Method method) {
    // 给指定的类增加方法
    return class_addMethod(theClass, selector,  method_getImplementation(method),  method_getTypeEncoding(method));
}

@implementation UILabel (ExchangeMethod)
// 交换方法的特点：一旦交换，则全局都替换
// 而load是在类添加运行时的时候被调用，且只被调用一次，所以在load方法中交换方法最合适
+ (void)load {
    // 从当前类中，获取准备交换的方法
//    Method swizzleMethod = class_getInstanceMethod([UILabel class], @selector(yx_setText:));
    
    // 将yx_setText方法添加到`UILable`上
//    BOOL isSuccess = af_addMethod([UILabel class], @selector(yx_setText:), swizzleMethod);
    
//    if (isSuccess) {// 如果方法添加成功
    
        // 交换`UILable`中原有的setText:方法
        af_swizzleSelector([UILabel class], @selector(setText:), @selector(yx_setText:));
//    }
}

// 要交换的方法
- (void)yx_setText:(NSString *)text {
    
    NSLog(@"%@",text);
}
@end
