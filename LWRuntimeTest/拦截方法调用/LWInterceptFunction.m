//
//  LWInterceptFunction.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/10/8.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWInterceptFunction.h"
#import <objc/runtime.h>
#import "LWFunctionAccept.h"

@implementation LWInterceptFunction

void runAddMethod(id self, SEL _cmd, NSString *string){
    NSLog(@"add C IMP %@", string);
}

+ (BOOL)resolveClassMethod:(SEL)sel{
    return YES;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    //给本类动态添加一个方法
    if ([NSStringFromSelector(sel) isEqualToString:@"resolveAdd:"]) {
        class_addMethod(self, sel, (IMP)runAddMethod, "v@:*");
         NSLog(@"LWInterceptFunction:拦截到resolveAdd方法");
    }
    //不管YES or NO 只要方法不存在，则进入forwardingTargetForSelector
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)sel{
    //动态转发一个方法
    if ([NSStringFromSelector(sel) isEqualToString:@"resolveForward:"]) {
        NSLog(@"LWInterceptFunction:拦截到resolveForward方法，并转发");
        return [[LWFunctionAccept alloc]init];
    }
    //如果返回的是nil，则进入forwardInvocation
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"~~~~%@", [anInvocation description]);
}
@end
