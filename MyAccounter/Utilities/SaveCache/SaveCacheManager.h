//
//  SaveCacheManager.h
//  MyAccounter
//
//  Created by AceWei on 2017/11/17.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYCache.h>
#import <MagicalRecord/MagicalRecord.h>

#import "Singleton.h"
#import "PayListKeyHeader.h"

#import "PayDataEntity+CoreDataClass.h"

@interface SaveCacheManager : NSObject

singleton_interface(SaveCacheManager)

//- (void)savePayDataArray:(NSArray <PayDataEntity *> *)arr;
- (void)addPayData:(PayDataEntity *)model;
//- (void)readPayData:(void (^)(PayDataModel *model))completeBlock;
//- (void)deletePayDataByPayID:(NSString *)paySaveID;

//+ (void)attempDealloc;

@end
