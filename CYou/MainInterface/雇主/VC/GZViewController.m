//
//  GZViewController.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/19.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "GZViewController.h"
#import "StatueBar.h"
#import "GZNavigationBar.h"

@interface GZViewController ()

@end

@implementation GZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"雇主";
    StatueBar *statueBar = [[StatueBar alloc] init];
    [self.view addSubview:statueBar];
    statueBar.bgColor = [UIColor brownColor];
//    GZNavigationBar *navigationBar = [[GZNavigationBar alloc] initWithHeight:44];
//    [self.view addSubview:navigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
