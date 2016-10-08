//
//  ViewController.m
//  LWRuntimeTest
//
//  Created by AloesLu on 2016/9/30.
//  Copyright © 2016年 AloesLu. All rights reserved.
//

#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"
#import "NSString+ExpansionAttribute.h"
#import "UIButton+ExpansionAttribute.h"
#import "NSString+ExchangeMethod.h"
#import "LWPrivateAttribute.h"
#import "LWPrintClassInfo.h"
#import "LWInterceptFunction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //测试NSString分类扩展属性
    NSString *str=[[NSString alloc]init];
    str.addName=@"111";
    NSLog(@"%@",str.addName);
    
    //测试UIButton分类扩展属性
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((kScreen_Width-80)/2, 40, 80, 40)];
//    [button setTitle:@"测试按钮" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor=[UIColor greenColor];
    button.someId=@"123456";
    button.buttonTypeNum=[NSNumber numberWithInt:10];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //测试NSString分类交换类方法
    NSLog(@"%@",[NSString description]);
    
    //测试UIImage分类交换类方法
    UIImage *image=[UIImage imageNamed:@"123"];
    
    //测试UILabel分类交换实例方法
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"test EXM"];
    
    //测试访问修改私有属性
    [LWPrivateAttribute testViewAndModifyPA];
    
    //测试获取类的信息列表
    [LWPrintClassInfo testPrintClass];
    
    LWInterceptFunction *lwif=[[LWInterceptFunction alloc]init];
    [lwif performSelector:@selector(resolveAdd:) withObject:@"testAdd"];
    [lwif performSelector:@selector(resolveForward:) withObject:@"testForward"];
}

- (void)buttonClick:(UIButton *)sender{
    NSLog(@"%@,,,,,,%d",sender.someId,[sender.buttonTypeNum intValue]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
