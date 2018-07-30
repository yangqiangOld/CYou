//
//  YQ_TabBar.h
//  CYou
//
//  Created by 时间财富网 on 2018/7/19.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YQ_TabBarDelegate <NSObject>

- (void)tab_BarCenterClict;

@end

@interface YQ_TabBar : UITabBar

@property (nonatomic, assign)id <YQ_TabBarDelegate>delegateCenter;
@property (nonatomic, strong)UIButton *centerBtn;

@end
