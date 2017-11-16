//
//  Target_Home.h
//  Created by acewei on 2017/11/16.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "Target_Home.h"
#import "HomeViewController.h"

@implementation Target_Home


- (UIViewController *)Action_ToHomeViewController:(NSDictionary *)params

{
    HomeViewController *HomeVC = [[HomeViewController alloc] init];

    /**
        example:
        if ([params valueForKey:@"<#model#>"]) {
            HomeVC.<#model#> = params[@"<#model#>"];
        }
     */

    return HomeVC;
}

@end