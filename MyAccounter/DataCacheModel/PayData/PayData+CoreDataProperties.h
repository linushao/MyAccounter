//
//  PayData+CoreDataProperties.h
//  
//
//  Created by AceWei on 2017/11/21.
//
//  This file was automatically generated and should not be edited.
//

#import "PayData+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PayData (CoreDataProperties)

+ (NSFetchRequest<PayData *> *)fetchRequest;

@property (nonatomic) double payPrince;
@property (nullable, nonatomic, copy) NSString *payDetail;
@property (nullable, nonatomic, copy) NSDate *updateDate;
@property (nullable, nonatomic, copy) NSDate *writeDate;
@property (nullable, nonatomic, copy) NSString *payLabel;
@property (nonatomic) int64_t payID;
@property (nullable, nonatomic, copy) NSString *paySaveID;

@end

NS_ASSUME_NONNULL_END
