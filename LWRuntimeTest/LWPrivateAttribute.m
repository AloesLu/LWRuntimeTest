//
//  LWPrivateAttribute.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/10/1.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWPrivateAttribute.h"
#import <objc/runtime.h>

@implementation LWPrivateAttribute

+ (void)testViewAndModifyPA{
    PrivateAttribute *pa= [PrivateAttribute new];
    // count记录类所有属性变量的数量  IVar是runtime声明的一个宏
    unsigned int count = 0;
    // 获取类的所有属性变量
    Ivar *menbers = class_copyIvarList([PrivateAttribute class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = menbers[i];
        // 将IVar变量转化为字符串,这里获得了属性名
        const char *memberName = ivar_getName(ivar);
        NSLog(@"%s",memberName);
        
        Ivar m_name = menbers[0];
        // 修改属性值
        object_setIvar(pa, m_name, @"zhangsan");
        // 打印后发现Father中name的值变为zhangsan
        NSLog(@"%@",[pa description]);
    }
}

@end


@interface PrivateAttribute ()
@property (nonatomic, copy) NSString *name;
@end
@implementation PrivateAttribute

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@",_name];
}
@end
