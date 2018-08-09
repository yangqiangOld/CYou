//
//  ModifyTheStoreVC.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/31.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "ModifyTheStoreVC.h"
#import "MTSTableView.h"
#import "MTSViewModel.h"

@interface ModifyTheStoreVC ()<CeshiProtocol, MTSTableViewDelegate>

@end

@implementation ModifyTheStoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    MTSTableView *mtView = [[MTSTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    mtView.delegate = self;
    [self.view addSubview:mtView];
    
    MTSViewModel *viewModel = [[MTSViewModel alloc] init];
    [viewModel registerHybridUrlHanlder:self];
    [viewModel netWorkStateWithNetConnectBlock:^(int netConnetState) {
        NSLog(@"修改页网络状态%d", netConnetState);
    } withURLStr:nil];
    
    [viewModel setBlockWithReturnBlock:^(id returnValue) {
        NSLog(@"%@", returnValue);
    } WithErrorBlock:^(id errorCode) {
        NSLog(@"%@", errorCode);
    } WithFailureBlock:^{
        NSLog(@"FailurlBlock");
    }];
    
    [viewModel requestData];
    
}

- (void)tableViweOfSection:(NSInteger)section withRow:(NSInteger)index {
    [self.tabBarController.tabBar setHidden:YES];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor yellowColor];
    vc.title = @"测试控制器";
    [self.navigationController pushViewController:vc animated:YES];
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)ceshiProtocol:(CeshiProtocolBlock)handler {
    NSLog(@"协议头文件测试");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
