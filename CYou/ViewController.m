//
//  ViewController.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/19.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking_YQ.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"The First");
    
    NSDictionary *para = @{@"format":@"2",
                           @"cityname":@"成都",
                           @"key":@"4f6c456cd6391faff642d30520639a8b"
                           };
//    http://app.680.com/api/v5/guzhu_index.ashx
//    https://app.680.com/api/v3/index_gz_data.ashx
    [AFNetworking_YQ postWithUrl:@"http://app.680.com/api/v5/guzhu_index.ashx" params:nil success:^(id responseObject) {
        
//        NSLog(@"测试数据：%@", responseObject);
        
    } failure:^(NSString *error) {
        
    }];
    
    [AFNetworking_YQ getWithUrl:@"http://v.juhe.cn/weather/index" params:para success:^(id responseObject) {

    } failure:^(NSString *error) {
        //隐藏处理
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
