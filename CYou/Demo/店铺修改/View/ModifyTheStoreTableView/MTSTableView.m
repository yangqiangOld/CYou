//
//  MTSTableView.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/31.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "MTSTableView.h"

static NSString *tableViewCellStr = @"tableViewCell";
static NSString *modeifyFirstCell = @"modeifyFirstCell";

@interface MTSTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *mutaArr;

@end

@implementation MTSTableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTableView];
        [self registerCell];
    }
    return self;
}

- (void)addTableView {
    [self addSubview:self.tableView];
}

- (void)registerCell {
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellStr];
}

- (void)layoutSubviews {
    _tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 84);
}

#pragma mart - TableView 协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellStr];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell点击处理%ld", indexPath.row);
}


- (void)reloadTableView {

    
    
    [_tableView reloadData];
}

- (void)reloadSection:(NSInteger)group indexOfCell:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:group];
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mart - get
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor blueColor];
    }
    return _tableView;
}

@end
