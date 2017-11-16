//
//  Target_Setting.h
//  Created by acewei on 2017/11/16.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "Target_Setting.h"
#import "SettingViewController.h"

@implementation Target_Setting


- (UIViewController *)Action_ToSettingViewController:(NSDictionary *)params

{
    SettingViewController *SettingVC = [[SettingViewController alloc] init];

    /**
        example:
        if ([params valueForKey:@"<#model#>"]) {
            SettingVC.<#model#> = params[@"<#model#>"];
        }
     */

    return SettingVC;
}

@end