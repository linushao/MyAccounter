//
//  TabbarViewController.h
//  Created by acewei on 2017/11/15.
//  Copyright © 2017年 acewei. All rights reserved.
//

#import "TabbarViewController.h"
#import <YYCategories.h>

#import "HomeViewController.h"
#import "SettingViewController.h"

@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self addHomeVC];
    [self addSettingVC];
//    [self setupTabbarItem];
}


#pragma mark - 设置tabbar item
- (void)setupTabbarItem
{
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGB:0x4e4e4e], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:11.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
//    
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGB:0x4e4e4e], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:11.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    
    UIViewController *HomeVC = [[UIViewController alloc] init];
    
    //HomeSearchViewController *HomeVC = [[HomeSearchViewController alloc] init];
    
    UINavigationController *navHome = [[UINavigationController alloc]initWithRootViewController:HomeVC];
    //navHome.navigationBarHidden = YES;
    
    navHome.tabBarItem.title = @"首页";
    //navHome.tabBarItem.image = [[UIImage imageNamed:@"tab_home_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //navHome.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_home_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navHome];
}


- (void)addHomeVC
{
    HomeViewController *vc = [[HomeViewController alloc] init];
    [self addController:vc title:@"首页" image:nil];
}


- (void)addSettingVC
{
    SettingViewController *vc = [[SettingViewController alloc] init];
    [self addController:vc title:@"设置" image:nil];
}


- (void)addController:(UIViewController *)vc
                title:(NSString *)title
                image:(UIImage *)img
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    nav.tabBarItem.title = title;
    
    if (img) {
        nav.tabBarItem.image = img;
    }
    
    [self addChildViewController:nav];
}


@end
