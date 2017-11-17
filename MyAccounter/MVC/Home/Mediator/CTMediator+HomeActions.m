//
//  CTMediator+HomeActions.h
//
//  Created by acewei on 2017/11/16.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "CTMediator+HomeActions.h"

NSString * const kCTMediatorTarget_Home = @"Home";
NSString * const kCTMediatorActionTo_HomeViewController = @"ToHomeViewController";

@implementation CTMediator (HomeActions)

- (UIViewController *)mediator_HomeViewControllerWithParams:(NSDictionary *)dict
{
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_Home
                                  action:kCTMediatorActionTo_HomeViewController
                                  params:dict
                       shouldCacheTarget:YES];

    if ([viewController isKindOfClass:[UIViewController class]]) {
//        if ([dict.allKeys containsObject:@"update"]) {
//            UITableView *table = [viewController valueForKey:@"tableView"];
//            [table reloadData];
//        }
        
        return viewController;
    } else {
        NSLog(@"%@ 未能实例化页面", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}

@end
