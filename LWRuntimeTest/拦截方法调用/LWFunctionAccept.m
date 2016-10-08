//
//  LWFunctionAccept.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/10/8.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWFunctionAccept.h"
#import <objc/runtime.h>

@implementation LWFunctionAccept

void runForwardMethod(id self, SEL _cmd, NSString *string){
    NSLog(@"add C IMP %@", string);
}

+ (BOOL)resolveClassMethod:(SEL)sel{
    return YES;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    //给本类动态添加一个方法
    if ([NSStringFromSelector(sel) isEqualToString:@"resolveForward:"]) {
        class_addMethod(self, sel, (IMP)runForwardMethod, "v@:*");
        NSLog(@"LWFunctionAccept:接收到转发的方法");
    }
    return YES;
}
@end
