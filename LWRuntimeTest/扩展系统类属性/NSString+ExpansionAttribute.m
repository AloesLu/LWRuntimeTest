//
//  NSString+ExpansionAttribute.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/9/30.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "NSString+ExpansionAttribute.h"
#import <objc/runtime.h>

@implementation NSString (ExpansionAttribute)
// 定义关联的key
static const char *key = "addName";
- (NSString *)addName
{
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject(self, key);
}
- (void)setAddName:(NSString *)addName
{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject(self, key, addName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
