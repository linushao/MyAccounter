//
//  SaveCacheManager.m
//  MyAccounter
//
//  Created by AceWei on 2017/11/17.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import "SaveCacheManager.h"

@interface SaveCacheManager ()

@property (nonatomic, strong) YYCache *cache;

@end

@implementation SaveCacheManager

singleton_implementation(SaveCacheManager)


- (instancetype)init
{
    self = [super init];
    if (self) {
        if (!self.cache) {
            self.cache = [YYCache cacheWithName:SavePayListKey];
        }
    }
    return self;
}

- (void)savePayDataArray:(NSArray <PayDataModel *> *)arr
{
//    [arr enumerateObjectsUsingBlock:^(PayDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [self.cache setObject:obj forKey:obj.paySaveID];
//    }];
}

- (void)addPayData:(PayDataModel *)model
{
//    [self.cache setObject:model forKey:model.paySaveID];
}

- (void)readPayData:(void (^)(PayDataModel *model))completeBlock
{
}

- (void)deletePayDataByPayID:(NSInteger)payID
{
    
}


//+ (void)attempDealloc{
//    onceToken = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
//    _instance = nil;
//}

@end
