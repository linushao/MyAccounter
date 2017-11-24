//
//  PayDataEntity+CoreDataProperties.h
//  
//
//  Created by AceWei on 2017/11/22.
//
//

#import "PayDataEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PayDataEntity (CoreDataProperties)

+ (NSFetchRequest<PayDataEntity *> *)fetchRequest;

/// 商品价格
@property (nonatomic) double payPrince;

/// 记录日期
@property (nullable, nonatomic, copy) NSDate *writeDate;

/// 商品详情
@property (nullable, nonatomic, copy) NSString *payDetail;

/// 最后一次更新日期
@property (nullable, nonatomic, copy) NSDate *updateDate;

/// 商品类型
@property (nullable, nonatomic, copy) NSString *payLabel;

@end

NS_ASSUME_NONNULL_END
