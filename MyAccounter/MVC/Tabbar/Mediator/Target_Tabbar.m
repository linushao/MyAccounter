//
//  Target_Tabbar.h
//  Created by acewei on 2017/11/15.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "Target_Tabbar.h"
#import "TabbarViewController.h"

@implementation Target_Tabbar


- (UIViewController *)Action_nativeToTabbarViewController:(NSDictionary *)params

{
    TabbarViewController *TabbarVC = [[TabbarViewController alloc] init];

    /**
        example:
        if ([params valueForKey:@"<#model#>"]) {
            TabbarVC.<#model#> = params[@"<#model#>"];
        }
     */

    return TabbarVC;
}

@end