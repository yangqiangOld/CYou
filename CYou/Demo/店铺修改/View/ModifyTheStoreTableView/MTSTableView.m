//
//  MTSTableView.m
//  CYou
//
//  Created by 时间财富网 on 2018/7/31.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "MTSTableView.h"
#import "ModeifyFirstTableViewCell.h"
#import "ModeifySecondTableViewCell.h"
#import "ModeifyThirdTableViewCell.h"

static NSString *tableViewCellStr = @"tableViewCell";
static NSString *modeifyFirstCell = @"modeifyFirstCell";
static NSString *modeifySecondCell = @"modeifySecondCell";
static NSString *modeifyThirdCell = @"modeifyThirdCell";

@interface MTSTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *titleArr;

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
    [_tableView registerClass:[ModeifyFirstTableViewCell class] forCellReuseIdentifier:modeifyFirstCell];
    [_tableView registerClass:[ModeifySecondTableViewCell class] forCellReuseIdentifier:modeifySecondCell];
    [_tableView registerClass:[ModeifyThirdTableViewCell class] forCellReuseIdentifier:modeifyThirdCell];
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
        return self.titleArr.count;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 60;
    }else if (indexPath.section == 1) {
        return 200;
    }else if (indexPath.section == 2) {
        ModeifyThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:modeifyThirdCell];
        return [cell cContentWithString:@"会计分录手机端发了会计师的费时间说的第三方说的水电费说的说的说的防守打法说的水电费说的水电费水电费水电费水电费水电费说的说的水电费水电费说的放松点"];
    }
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        ModeifyFirstTableViewCell *firstSection = [tableView dequeueReusableCellWithIdentifier:modeifyFirstCell];
        firstSection.title.text = self.titleArr[indexPath.row];
        return firstSection;
    }else if (indexPath.section == 1) {
        ModeifySecondTableViewCell *secondSection = [tableView dequeueReusableCellWithIdentifier:modeifySecondCell];
        
        return secondSection;
    }else if (indexPath.section == 2) {
        ModeifyThirdTableViewCell *thirdSection = [tableView dequeueReusableCellWithIdentifier:modeifyThirdCell];
        
        thirdSection.content.text = @"会计分录手机端发了会计师的费时间说的第三方说的水电费说的说的说的防守打法说的水电费说的水电费水电费水电费水电费水电费说的说的水电费水电费说的放松点";
        
        [thirdSection.content setColumSpace:5.f];
        [thirdSection.content setRowSpace:5.f];

        return thirdSection;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellStr];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(tableViweOfSection:withRow:)]) {
            [self.delegate tableViweOfSection:indexPath.section withRow:indexPath.row];
        }
    }
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
        _tableView.backgroundColor = [UIColor whiteColor];
        
        self.tableView.estimatedRowHeight = 100;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

- (NSArray *)titleArr {
    
    if (!_titleArr) {
        _titleArr = @[@"所在地区", @"店铺类型", @"店铺名称"];
    }
    return _titleArr;
}

@end
