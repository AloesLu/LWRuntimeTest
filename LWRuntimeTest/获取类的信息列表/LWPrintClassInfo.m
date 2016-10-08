//
//  LWPrintClassInfo.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/10/8.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import "LWPrintClassInfo.h"
#import <objc/runtime.h>
@interface LWPrintClassInfo()<LWPrintClassInfoDelegate>{
    NSString *sex;
}
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSNumber *age;
@end

@implementation LWPrintClassInfo

+(void)testPrintClass{
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
}

-(void)printName{
    NSLog(@"%@",self.name);
}
-(void)printAge{
    NSLog(@"%@",self.age);
}
-(void)printSex{
    NSLog(@"%@",sex);
}
@end
