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

@interface ModifyTheStoreVC ()

@end

@implementation ModifyTheStoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    MTSTableView *mtView = [[MTSTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:mtView];
    
    MTSViewModel *viewModel = [[MTSViewModel alloc] init];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
