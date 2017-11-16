//
//  CTMediator+SettingActions.h
//
//  Created by acewei on 2017/11/16.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "CTMediator+SettingActions.h"

NSString * const kCTMediatorTarget_Setting = @"Setting";
NSString * const kCTMediatorActionTo_SettingViewController = @"ToSettingViewController";

@implementation CTMediator (SettingActions)

- (UIViewController *)mediator_SettingViewControllerWithParams:(NSDictionary *)dict
{
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_Setting
                                  action:kCTMediatorActionTo_SettingViewController
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