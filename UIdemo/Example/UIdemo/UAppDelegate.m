//
//  UAppDelegate.m
//  UIdemo
//
//  Created by 82560897 on 05/27/2024.
//  Copyright (c) 2024 82560897. All rights reserved.
//

#import "UAppDelegate.h"
#import "UViewController.h"
#import "CViewController.h"

@implementation UAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    UIViewController *homeVC = [[UViewController alloc] init];;
    homeVC.title = @"table";
    UINavigationController *homeNaviVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UITabBarItem *item0 = [[UITabBarItem alloc] initWithTitle:homeVC.title image:[UIImage imageNamed:@"img1"] selectedImage:[UIImage imageNamed:@"img2"]];
    homeNaviVC.tabBarItem = item0;
    
    UIViewController *contactVC = [[CViewController alloc] init];
    contactVC.title = @"collection";
    UINavigationController *contactNaviVC = [[UINavigationController alloc] initWithRootViewController:contactVC];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:contactVC.title image:[UIImage imageNamed:@"img3"] selectedImage:[UIImage imageNamed:@"img4"]];
    contactNaviVC.tabBarItem = item1;
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.viewControllers = @[homeNaviVC, contactNaviVC];
    tabBarVC.selectedViewController = homeNaviVC;
    
//    tabBarVC.tabBar.backgroundImage = [UIImage imageNamed:@"image"];
    //设置选中时文字颜色
    tabBarVC.tabBar.tintColor = [UIColor colorWithRed:254/255.0 green:234/255.0 blue:42/255.0 alpha:1.0];
    
    //选中时使用原图片
    for (UITabBarItem *item in tabBarVC.tabBar.items) {
        UIImage *image = item.selectedImage;
        UIImage *correctImage =[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = correctImage;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end