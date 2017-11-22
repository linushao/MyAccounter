//
//  PayDataModel.h
//  MyAccounter
//
//  Created by AceWei on 2017/11/22.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface PayDataModel : NSObject

singleton_interface(PayDataModel)

/// 商品价格
@property (nonatomic) double payPrince;

/// 记录日期
@property (nonatomic, copy) NSDate *writeDate;

/// 商品详情
@property (nonatomic, copy) NSString *payDetail;

/// 最后一次更新日期
@property (nonatomic, copy) NSDate *updateDate;

/// 商品标签
@property (nonatomic, copy) NSString *payLabel;


+ (void)attempDealloc;

@end
