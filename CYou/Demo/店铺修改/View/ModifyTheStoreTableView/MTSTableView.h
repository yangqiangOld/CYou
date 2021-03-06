//
//  MTSTableView.h
//  CYou
//
//  Created by 时间财富网 on 2018/7/31.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MTSTableViewDelegate <NSObject>

- (void)tableViweOfSection:(NSInteger)section withRow:(NSInteger)index;

@end

@interface MTSTableView : UIView

@property (nonatomic, assign)id <MTSTableViewDelegate> delegate;

- (void)reloadTableView;

- (void)reloadSection:(NSInteger)group indexOfCell:(NSInteger)index;

@end
