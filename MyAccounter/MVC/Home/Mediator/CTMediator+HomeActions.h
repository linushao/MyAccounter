//
//  CTMediator+HomeActions.h
//
//  Created by acewei on 2017/11/16.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>

@interface CTMediator (HomeActions)

- (UIViewController *)mediator_HomeViewControllerWithParams:(NSDictionary *)dict;

@end