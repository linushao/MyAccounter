//
//  PayDataEntity+CoreDataProperties.m
//  
//
//  Created by AceWei on 2017/11/22.
//
//

#import "PayDataEntity+CoreDataProperties.h"

@implementation PayDataEntity (CoreDataProperties)

+ (NSFetchRequest<PayDataEntity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PayDataEntity"];
}

@dynamic payPrince;
@dynamic writeDate;
@dynamic payDetail;
@dynamic updateDate;
@dynamic payLabel;

@end
