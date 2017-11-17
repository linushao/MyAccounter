//
//  SaveCacheManager.h
//  MyAccounter
//
//  Created by AceWei on 2017/11/17.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYCache.h>

#import "Singleton.h"
#import "PayListKeyHeader.h"
#import "PayDataModel.h"

@interface SaveCacheManager : NSObject

singleton_interface(SaveCacheManager)

- (void)savePayDataArray:(NSArray <PayDataModel *> *)arr;
- (void)addPayData:(PayDataModel *)model;
- (void)readPayData:(void (^)(NSArray <PayDataModel *> *arr))completeBlock;
- (void)deletePayDataByPayID:(NSInteger)payID;

@end
