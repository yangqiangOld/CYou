//
//  ModeifyFirstTableViewCell.h
//  CYou
//
//  Created by 时间财富网 on 2018/8/1.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModeifyFirstModel;

@interface ModeifyFirstTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *content;
@property (nonatomic, strong)UIImageView *icon;

- (void)fillDataWith:(ModeifyFirstModel *)model;

@end
