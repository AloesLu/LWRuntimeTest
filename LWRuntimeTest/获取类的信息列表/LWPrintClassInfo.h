//
//  LWPrintClassInfo.h
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/10/8.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol LWPrintClassInfoDelegate
-(void)printSex;
@end

@interface LWPrintClassInfo : NSObject
+(void)testPrintClass;
@end
