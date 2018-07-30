//
//  StatueBar.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/30.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "StatueBar.h"

#define kIs_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

@implementation StatueBar

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];        
        self.frame = CGRectMake(0, 0, ScreenWidth, kIs_iPhoneX ? 44.f : 20.f);
    }
    return self;
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.backgroundColor = _bgColor;
}

@end
