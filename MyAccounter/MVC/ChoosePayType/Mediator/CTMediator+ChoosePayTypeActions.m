//
//  CTMediator+ChoosePayTypeActions.h
//
//  Created by acewei on 2017/11/20.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "CTMediator+ChoosePayTypeActions.h"

NSString * const kCTMediatorTarget_ChoosePayType = @"ChoosePayType";
NSString * const kCTMediatorActionNativeTo_ChoosePayTypeViewController = @"nativeToChoosePayTypeViewController";

@implementation CTMediator (ChoosePayTypeActions)

- (UIViewController *)mediator_ChoosePayTypeViewControllerWithParams:(NSDictionary *)dict
{
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_ChoosePayType
                                  action:kCTMediatorActionNativeTo_ChoosePayTypeViewController
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