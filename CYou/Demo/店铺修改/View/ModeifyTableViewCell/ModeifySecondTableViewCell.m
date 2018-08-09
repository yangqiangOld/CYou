//
//  ModeifySecondTableViewCell.m
//  CYou
//
//  Created by 时间财富网 on 2018/8/6.
//  Copyright © 2018年 时间财富网. All rights reserved.
//

#import "ModeifySecondTableViewCell.h"
#import "ModeifyChooseSkillsCollectionViewCell.h"

static NSString *skillsCollectionCell = @"skillCollectionCell";

@interface ModeifySecondTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)UIButton *chooseSkills;
@property (nonatomic, strong)UILabel *titleLab;
@property (nonatomic, strong)UIImageView *arrowImageView;
@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation ModeifySecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addModeifySecondView];
        [self registerCollectionCell];
    }
    return self;
}

- (void)addModeifySecondView {
    UIView *topMargView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    topMargView.backgroundColor = [UIColor colorWithHexString:@"f3f3f3"];
    [self.contentView addSubview:topMargView];
    
    [self.contentView addSubview:self.chooseSkills];
    [self.contentView addSubview:self.collectionView];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 70, ScreenWidth, 1)];
    bottomLine.backgroundColor = [UIColor colorWithHexString:@"e7e7e7"];
    [self.contentView addSubview:bottomLine];
}

- (void)registerCollectionCell {
    [_collectionView registerClass:[ModeifyChooseSkillsCollectionViewCell class] forCellWithReuseIdentifier:skillsCollectionCell];
}

- (void)layoutSubviews {
    [_chooseSkills mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(@60);
    }];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.centerY.mas_equalTo(self->_chooseSkills.mas_centerY);
    }];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(80);
        make.left.right.equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-10);
    }];
}

#pragma mart - UICollection Delegate and DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ModeifyChooseSkillsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:skillsCollectionCell forIndexPath:indexPath];

    return cell;
}


#pragma mart - 属性
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.minimumLineSpacing = 1;
//        layout.minimumInteritemSpacing = 1;
        layout.itemSize = CGSizeMake((ScreenWidth - 45) / 4, 35);
//        layout.estimatedItemSize = CGSizeMake(320, 60);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(15, 8, 15, 5);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UIButton *)chooseSkills {
    
    if (!_chooseSkills) {
        _chooseSkills = [UIButton buttonWithType:UIButtonTypeCustom];
        
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.text = [NSString stringWithFormat:@"技能选择"];
        titleLab.font = [UIFont systemFontOfSize:18];
        titleLab.textColor = [UIColor colorWithHexString:@"999999"];
        [_chooseSkills addSubview:titleLab];
        self.titleLab = titleLab;
        UIImageView *arrowImageView = [[UIImageView alloc] init];
        [_chooseSkills addSubview:arrowImageView];
        self.arrowImageView = arrowImageView;
    }
    return _chooseSkills;
}

@end
