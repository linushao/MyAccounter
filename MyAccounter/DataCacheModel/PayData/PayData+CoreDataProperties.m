//
//  PayData+CoreDataProperties.m
//  
//
//  Created by AceWei on 2017/11/21.
//
//  This file was automatically generated and should not be edited.
//

#import "PayData+CoreDataProperties.h"

@implementation PayData (CoreDataProperties)

+ (NSFetchRequest<PayData *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PayData"];
}

@dynamic payPrince;
@dynamic payDetail;
@dynamic updateDate;
@dynamic writeDate;
@dynamic payLabel;
@dynamic payID;
@dynamic paySaveID;

@end
