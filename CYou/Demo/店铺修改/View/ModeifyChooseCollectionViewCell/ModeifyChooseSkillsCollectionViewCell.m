//
//  ModeifyChooseSkillsCollectionViewCell.m
//  CYou
//
//  Created by 时间财富网 on 2018/8/7.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "ModeifyChooseSkillsCollectionViewCell.h"

@implementation ModeifyChooseSkillsCollectionViewCell

@synthesize titleLab = titleLab_;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithHexString:@"fa4242"];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.height/2;
        
        [self addChooseSkillsViews];
    }
    return self;
}

- (void)addChooseSkillsViews {
    titleLab_ = [[UILabel alloc] init];
    titleLab_.textAlignment = NSTextAlignmentCenter;
    titleLab_.font = [UIFont systemFontOfSize:16];
    titleLab_.text = [NSString stringWithFormat:@"平面设计"];
    titleLab_.textColor = [UIColor whiteColor];
    [self.contentView addSubview:titleLab_];
}

- (void)layoutSubviews {
    [titleLab_ mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
}

@end
