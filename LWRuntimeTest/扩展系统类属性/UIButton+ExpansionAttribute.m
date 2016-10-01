//
//  UIButton+ExpansionAttribute.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/9/30.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "UIButton+ExpansionAttribute.h"
#import <objc/runtime.h>

@implementation UIButton (ExpansionAttribute)

// 定义关联的key
static const char *someIdKey = "someId";
- (NSString *)someId
{
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject(self, someIdKey);
}
- (void)setSomeId:(NSString *)someId
{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject(self, someIdKey, someId, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *buttonTypeNumKey = "buttonTypeNum";
- (NSNumber *)buttonTypeNum
{
    return objc_getAssociatedObject(self, buttonTypeNumKey);
}
- (void)setButtonTypeNum:(NSNumber *)buttonTypeNum
{
    objc_setAssociatedObject(self, buttonTypeNumKey, buttonTypeNum, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
