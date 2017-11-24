//
//  PayTypeListView.h
//  MyAccounter
//
//  Created by AceWei on 2017/11/20.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PayTypeListViewDelegate <NSObject>

- (void)PayTypeListViewClick:(UIButton *)btn index:(NSInteger)index;

@end

@interface PayTypeListView : UIView

@property (nonatomic, weak) id<PayTypeListViewDelegate> delegate;

/// 选择的类型下标
@property (nonatomic, assign) NSInteger payLabelIndex;
/// 选择的类型
@property (nonatomic, strong) NSString *payLabel;


/// 创建带有下标的对象
+ (instancetype)createWithPayLabelIndex:(NSInteger)index;

/// 读取配置列表文件
+ (NSArray *)readJSON2Array;

@end
