//
//  AppDelegate+UnitTestViewController.m
//  MyAccounter
//
//  Created by AceWei on 2017/11/16.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import "AppDelegate+UnitTestViewController.h"
#import <YYCategories.h>
#import <YYModel.h>


@implementation AppDelegate (UnitTestViewController)

#pragma mark - 单元测试ViewController
- (void)unitTestHomeViewController
{
    HomeViewController *vc = [[HomeViewController alloc] init];
    
    id data = [self readJsonWithName:@"PayDataModelJson"];
    vc.dataArray = [NSMutableArray arrayWithArray:data];
    
    [self setupWindowRootViewController:vc];
}


- (void)unitTestAddPayListViewController
{
    AddPayListViewController *vc = [[AddPayListViewController alloc] init];
    
    [self setupWindowRootViewController:vc];
}


- (void)unitTestChoosePayTypeListViewController
{
    ChoosePayTypeViewController *vc = [[ChoosePayTypeViewController alloc] init];
    
    [self setupWindowRootViewController:vc];
}


#pragma mark - 初始化VC，有导航栏
- (void)setupWindowRootViewController:(UIViewController *)vc
{
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    UINavigationController * naviC = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = naviC;
    [self.window makeKeyAndVisible];
}


#pragma mark 初始化VC，不用导航栏
- (void)setupWindowRootViewControllerNoNAV:(UIViewController *)vc
{
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}


#pragma mark 返回字典或者数组
/// 返回字典或者数组
- (id)readJsonWithName:(NSString *)jsonName
{
    NSString *jsonStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:jsonName ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    
    id data = [jsonStr jsonValueDecoded];
    
    return data;
}

@end
