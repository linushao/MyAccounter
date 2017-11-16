//
//  CTMediator+TabbarActions.h
//
//  Created by acewei on 2017/11/15.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "CTMediator+TabbarActions.h"

NSString * const kCTMediatorTarget_Tabbar = @"Tabbar";
NSString * const kCTMediatorActionNativeTo_TabbarViewController = @"NativeToTabbarViewController";

@implementation CTMediator (TabbarActions)

- (UIViewController *)mediator_TabbarViewControllerWithParams:(NSDictionary *)dict
{
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_Tabbar
                                  action:kCTMediatorActionNativeTo_TabbarViewController
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