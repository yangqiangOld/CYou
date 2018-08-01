//
//  ModeifyFirstTableViewCell.m
//  CYou
//
//  Created by 时间财富网 on 2018/8/1.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "ModeifyFirstTableViewCell.h"
#import "ModeifyFirstModel.h"

@implementation ModeifyFirstTableViewCell

@synthesize title = title_;
@synthesize content = content_;
@synthesize icon = icon_;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addModeifyFirstView];
    }
    return self;
}

- (void)addModeifyFirstView {
    title_ = [[UILabel alloc] init];
    content_ = [[UILabel alloc] init];
    icon_ = [[UIImageView alloc] init];
    
    [self.contentView addSubview:title_];
    [self.contentView addSubview:content_];
    [self.contentView addSubview:icon_];
}

- (void)layoutSubviews {
    [title_ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
    
    [icon_ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.width.height.lessThanOrEqualTo(@20);
    }];
    
    [content_ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self->icon_.mas_right).offset(10);
    }];
}

- (void)fillDataWith:(ModeifyFirstModel *)model {
    content_.text = model.content;
}

@end
