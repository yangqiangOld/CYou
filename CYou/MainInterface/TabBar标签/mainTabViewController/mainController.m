//
//  mainController.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/19.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "mainController.h"
#import "YQ_TabBar.h"
#import "GZViewController.h"
#import "WKViewController.h"
#import "ZPViewController.h"
#import "PersonViewController.h"

@interface mainController ()<YQ_TabBarDelegate>

@end

@implementation mainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YQ_TabBar *tabBar = [[YQ_TabBar alloc] init];
    tabBar.delegateCenter = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self addchildVc];
}

- (void)addchildVc {
    
    GZViewController *gz = [[GZViewController alloc] init];
    gz.view.backgroundColor = [UIColor yellowColor];
    UINavigationController *GZnav = [[UINavigationController alloc] initWithRootViewController:gz];
    [self setTabBarItem:GZnav.tabBarItem
                  title:@"雇主"
              titleSize:13.0
          titleFontName:@"HeiTi SC"
          selectedImage:@"first_selected.png"
     selectedTitleColor:[UIColor redColor]
            normalImage:@"first_normal.png"
       normalTitleColor:[UIColor grayColor]];
    
    WKViewController *wk = [[WKViewController alloc] init];
    wk.view.backgroundColor = [UIColor blueColor];
    UINavigationController *WKnav = [[UINavigationController alloc] initWithRootViewController:wk];
    [self setTabBarItem:WKnav.tabBarItem
                  title:@"威客"
              titleSize:13.0
          titleFontName:@"HeiTi SC"
          selectedImage:@"second_selected.png"
     selectedTitleColor:[UIColor redColor]
            normalImage:@"second_normal.png"
       normalTitleColor:[UIColor grayColor]];
    
    ZPViewController *zp = [[ZPViewController alloc] init];
    zp.view.backgroundColor = [UIColor greenColor];
    UINavigationController *ZPnav = [[UINavigationController alloc] initWithRootViewController:zp];
    [self setTabBarItem:ZPnav.tabBarItem
                  title:@"作品"
              titleSize:13.0
          titleFontName:@"HeiTi SC"
          selectedImage:@"third_selected.png"
     selectedTitleColor:[UIColor redColor]
            normalImage:@"third_normal.png"
       normalTitleColor:[UIColor grayColor]];
    
    PersonViewController *person = [[PersonViewController alloc] init];
    person.view.backgroundColor = [UIColor redColor];
    UINavigationController *PSnav = [[UINavigationController alloc] initWithRootViewController:person];
    [self setTabBarItem:PSnav.tabBarItem
                  title:@"个人"
              titleSize:13.0
          titleFontName:@"HeiTi SC"
          selectedImage:@"fourth_selected.png"
     selectedTitleColor:[UIColor redColor]
            normalImage:@"fourth_normal.png"
       normalTitleColor:[UIColor grayColor]];

    
    NSArray *vcArr = [NSArray arrayWithObjects:GZnav, WKnav, ZPnav, PSnav, nil];
    
    self.viewControllers = vcArr;
    
}

- (void)setTabBarItem:(UITabBarItem *)tabbarItem
                title:(NSString *)title
            titleSize:(CGFloat)size
        titleFontName:(NSString *)fontName
        selectedImage:(NSString *)selectedImage
   selectedTitleColor:(UIColor *)selectColor
          normalImage:(NSString *)unselectedImage
     normalTitleColor:(UIColor *)unselectColor {
    
    //设置图片
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // S未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:[UIFont fontWithName:fontName size:size]} forState:UIControlStateNormal];
    
    // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:[UIFont fontWithName:fontName size:size]} forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)tab_BarCenterClict {
      NSLog(@"tabBarClickCenter");
}


@end
