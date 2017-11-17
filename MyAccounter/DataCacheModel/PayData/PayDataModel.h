//
//  PayDataModel.h
//  MyAccounter
//
//  Created by AceWei on 2017/11/17.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface PayDataModel : NSObject

/// 商品价格
@property (nonatomic, assign) double payPrince;

/// 商品详情
@property (nonatomic, copy) NSString *payDetail;

/// 最后一次更新日期
@property (nonatomic, copy) NSDate *updateDate;

/// 记录日期
@property (nonatomic, copy) NSDate *writeDate;

/// 商品ID
@property (nonatomic, assign) NSInteger payID;

/// 商品标签
@property (nonatomic, copy) NSString *payLabel;

@end
