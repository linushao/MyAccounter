//
//  CTMediator+AddPayListActions.h
//
//  Created by acewei on 2017/11/16.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "CTMediator+AddPayListActions.h"

NSString * const kCTMediatorTarget_AddPayList = @"AddPayList";
NSString * const kCTMediatorActionNativeTo_AddPayListViewController = @"nativeToAddPayListViewController";

@implementation CTMediator (AddPayListActions)

- (UIViewController *)mediator_AddPayListViewControllerWithParams:(NSDictionary *)dict
{
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_AddPayList
                                  action:kCTMediatorActionNativeTo_AddPayListViewController
                                  params:dict
                       shouldCacheTarget:YES];

    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        NSLog(@"%@ 未能实例化页面", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}

@end
