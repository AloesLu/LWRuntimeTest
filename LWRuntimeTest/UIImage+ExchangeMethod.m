//
//  UIImage+ExchangeMethod.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/9/30.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "UIImage+ExchangeMethod.h"
#import <objc/runtime.h>

@implementation UIImage (ExchangeMethod)
+(void)load
{
    //获取imageNamed方法地址
    Method imageNamed = class_getClassMethod(self, @selector(imageNamed:));
    //获取分类添加的imageNamed方法地址
    Method myImageNamed = class_getClassMethod(self, @selector(myImageNamed:));
    //交换方法地址，交换方法实现
    method_exchangeImplementations(myImageNamed, imageNamed);
    
    [super load];
}

+(UIImage *)myImageNamed:(NSString *)name
{
    //1.加载图片
    UIImage *image = [UIImage myImageNamed:name];
    if (image == nil) {
        NSLog(@"加载失败");
    }
    return image;
}
@end
