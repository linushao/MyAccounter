//
//  Target_AddPayList.h
//  Created by acewei on 2017/11/16.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "Target_AddPayList.h"
#import "AddPayListViewController.h"

@implementation Target_AddPayList


- (UIViewController *)Action_nativeToAddPayListViewController:(NSDictionary *)params

{
    AddPayListViewController *AddPayListVC = [[AddPayListViewController alloc] init];

    /**
        example:
        if ([params valueForKey:@"<#model#>"]) {
            AddPayListVC.<#model#> = params[@"<#model#>"];
        }
     */

    return AddPayListVC;
}

@end