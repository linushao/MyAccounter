//
//  Target_ChoosePayType.h
//  Created by acewei on 2017/11/20.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "Target_ChoosePayType.h"
#import "ChoosePayTypeViewController.h"

@implementation Target_ChoosePayType


- (UIViewController *)Action_nativeToChoosePayTypeViewController:(NSDictionary *)params

{
    ChoosePayTypeViewController *ChoosePayTypeVC = [[ChoosePayTypeViewController alloc] init];

    /**
        example:
        if ([params valueForKey:@"<#model#>"]) {
            ChoosePayTypeVC.<#model#> = params[@"<#model#>"];
        }
     */

    return ChoosePayTypeVC;
}

@end
