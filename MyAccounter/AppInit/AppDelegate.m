//
//  AppDelegate.m
//  MyAccounter
//
//  Created by AceWei on 2017/11/14.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import "AppDelegate.h"
#import "CTMediator.h"
#import <MagicalRecord/MagicalRecord.h>

#import "AppDelegate+UnitTestViewController.h"

#import "BaseViewController.h"
#import "TabbarViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *nav;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [MagicalRecord setupAutoMigratingCoreDataStack];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    TabbarViewController *_tabbarvc =[[TabbarViewController alloc] init];
    
    [self.window setRootViewController:_tabbarvc];
    [self.window makeKeyAndVisible];
    
    
#if DEBUG
//    [self unitTestHomeViewController];
    [self unitTestAddPayListViewController];
//    [self unitTestChoosePayTypeListViewController];
#endif
    
    
//    [DDLog addLogger:[DDASLLogger sharedInstance]];
//    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [MagicalRecord cleanUp];
}
    
    
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    id vc = [[CTMediator sharedInstance] performActionWithUrl:url completion:nil];
    
    if (vc) {
        [_nav pushViewController:vc animated:YES];
    }
    
    return vc?YES:NO;
    
//    return [[[CTMediator sharedInstance] performActionWithUrl:url completion:nil] boolValue];
}


@end
