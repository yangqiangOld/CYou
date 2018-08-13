//
//  AppDelegate+Interface.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/24.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "AppDelegate+Interface.h"
#import "ViewController.h"
#import "mainController.h"

@implementation AppDelegate (Interface)

- (void)rootViewControllerInterface {
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//    [manager startMonitoring];
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        NSLog(@"网络状态：%ld", status);
//    }];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
//    ViewController *testVC = [[ViewController alloc] init];
//    testVC.view.backgroundColor = [UIColor whiteColor];
    
    mainController *vc = [[mainController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}

@end
