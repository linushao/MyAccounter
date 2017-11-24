//
//  PayDataModel.h
//  MyAccounter
//
//  Created by AceWei on 2017/11/23.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface PayDataModel : NSObject

/// 商品价格
@property (nonatomic, assign) double payPrince;

/// 记录日期
@property (nonatomic, copy) NSDate *writeDate;

/// 商品详情
@property (nonatomic, copy) NSString *payDetail;

/// 最后一次更新日期
@property (nonatomic, copy) NSDate *updateDate;

/// 商品类型标签
@property (nonatomic, copy) NSString *payLabel;

/// 商品类型下标
@property (nonatomic, assign) NSInteger payTypeIndex;

@end
