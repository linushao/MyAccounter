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
            self.cache = [YYCache ca]
        }
    }
    return self;
}

- (void)savePayData
{
    
}

@end
