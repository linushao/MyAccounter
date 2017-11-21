//
//  PayTypeControl.m
//  MyAccounter
//
//  Created by AceWei on 2017/11/20.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import "PayTypeControl.h"

@implementation PayTypeControl

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupUI];
}


- (void)setupUI
{
    [self addTitleLabel];
    [self addContentLabel];
}


- (void)addTitleLabel
{
    if (!self.titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
    }
    
    if (![self isDescendantOfView:self.titleLabel]) {
        [self addSubview:self.titleLabel];
    }
    
    @weakify(self);
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.mas_equalTo(weak_self.size.height/2);
    }];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.text = @"类目";
}


- (void)addContentLabel
{
    if (!self.descriptionLabel) {
        self.descriptionLabel = [[UILabel alloc] init];
    }
    
    if (![self isDescendantOfView:self.descriptionLabel]) {
        [self addSubview:self.descriptionLabel];
    }
    
    [self.descriptionLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.offset(0);
        make.height.mas_equalTo(self.titleLabel);
    }];
    
    self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
    self.descriptionLabel.font = [UIFont systemFontOfSize:12];
    self.descriptionLabel.text = @"日常";
}

@end
