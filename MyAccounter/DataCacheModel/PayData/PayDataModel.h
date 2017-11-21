//
//  PayDataModel.h
//  MyAccounter
//
//  Created by AceWei on 2017/11/17.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <YYModel.h>
#import <CoreData/CoreData.h>
#import <MJExtension.h>

@interface PayDataModel : NSManagedObject

/// 商品价格
@property (nonatomic, assign) double payPrince;

/// 商品详情
@property (nonatomic, copy) NSString *payDetail;

/// 最后一次更新日期
//@property (nonatomic, copy) NSDate *updateDate;

/// 记录日期
@property (nonatomic, copy) NSDate *writeDate;

/// 商品标签
@property (nonatomic, copy) NSString *payLabel;

/// 商品ID
@property (nonatomic, assign) NSInteger payID;

/// 商品save ID
//@property (nonatomic, copy) NSString *paySaveID;


@end
