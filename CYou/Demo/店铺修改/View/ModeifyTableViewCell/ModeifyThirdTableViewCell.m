//
//  ModeifyThirdTableViewCell.m
//  CYou
//
//  Created by 时间财富网 on 2018/8/6.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "ModeifyThirdTableViewCell.h"

@interface ModeifyThirdTableViewCell ()

@property (nonatomic, strong)UIView *headView;

@end

@implementation ModeifyThirdTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addModeifyThirdView];
    }
    return self;
}

- (void)addModeifyThirdView {
    UIView *topMargView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    topMargView.backgroundColor = [UIColor colorWithHexString:@"f3f3f3"];
    [self.contentView addSubview:topMargView];
    
    [self.contentView addSubview:self.headView];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 70, ScreenWidth, 1)];
    bottomLine.backgroundColor = [UIColor colorWithHexString:@"e7e7e7"];
    [self.contentView addSubview:bottomLine];
    
    [self.contentView addSubview:self.content];
}

- (void)layoutSubviews {
    
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(10);
        make.left.right.equalTo(self);
        make.height.equalTo(@60);
    }];
    
    _content.frame = CGRectMake(10, 86, ScreenWidth - 20, 20);
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(30);
        make.right.mas_equalTo(self.mas_right).offset(-30);
        make.top.mas_equalTo(self.mas_top).offset(86);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-15);
        
    }];
}

- (CGFloat)cContentWithString:(NSString *)string {
    //TODO
    _content.text = string;
    [_content setColumSpace:2.f];
    [_content setRowSpace:5.f];

    // 计算高度
    CGSize size = [_content.attributedText boundingRectWithSize:CGSizeMake(self.frame.size.width-60, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    return size.height + 71 + 30;

}

#pragma mart - 属性
- (UILabel *)content {
    if (!_content) {
        _content = [[UILabel alloc] init];
        _content.textColor = [UIColor colorWithHexString:@"666666"];
        _content.numberOfLines = 0;
    }
    return _content;
}

- (UIView *)headView {
    if (!_headView) {
        _headView = [[UIView alloc] init];
        
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textColor = [UIColor colorWithHexString:@"999999"];
        titleLab.text = [NSString stringWithFormat:@"店铺描述"];
        titleLab.font = [UIFont systemFontOfSize:18];
        [_headView addSubview:titleLab];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_headView.mas_left).offset(20);
            make.centerY.mas_equalTo(self->_headView.mas_centerY);
        }];
    }
    return _headView;
}

@end
