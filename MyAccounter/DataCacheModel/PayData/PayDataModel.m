//
//  PayDataModel.m
//  MyAccounter
//
//  Created by AceWei on 2017/11/22.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import "PayDataModel.h"

@implementation PayDataModel

singleton_implementation(PayDataModel)

- (void)setUpdateDate:(NSDate *)updateDate
{
    _updateDate = [NSDate date];
}

+ (void)attempDealloc
{
    onceToken = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    _instance = nil;
}

@end
