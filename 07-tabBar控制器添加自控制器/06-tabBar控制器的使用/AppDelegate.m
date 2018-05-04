//
//  AppDelegate.m
//  06-tabBar控制器的使用
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //2.创建控制器
    UITabBarController * tabBarVC = [[UITabBarController alloc] init];
    //设置背景颜色
    tabBarVC.view.backgroundColor = [UIColor redColor];
    
    //2.1 添加子控制器
    //2.1.1创建第一个子控制器
    OneViewController * one = [[OneViewController alloc] init];
    
    //设置标题
    one.tabBarItem.title = @"老大";
    //通过addChildViewController添加子控制器
//    [tabBarVC addChildViewController:one];
    
    
    //2.1.2创建第二个子控制器
    TwoViewController * two = [[TwoViewController alloc] init];
    
    //设置标题
    two.tabBarItem.title = @"老二";
    
    //设置图片
    two.tabBarItem.image = [UIImage imageNamed:@"navigationbar_friendsearch"];
    
    //设置选中图片
//    two.tabBarItem.selectedImage = [UIImage imageNamed:@"navigationbar_friendsearch_highlighted"];
    
    //加载图片
    UIImage * selectImage = [UIImage imageNamed:@"navigationbar_friendsearch_highlighted"];
    
    //修改图片的渲染模式
    
    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    two.tabBarItem.selectedImage = selectImage;
    
     //通过addChildViewController添加子控制器
//    [tabBarVC addChildViewController:two];
    
    
    //2.1.3创建第三个子控制器
    
    ThreeViewController * three = [[ThreeViewController alloc] init];
    
    //设置标题
    three.tabBarItem.title = @"小三";
    
    //通过addChildViewController添加子控制
//    [tabBarVC addChildViewController:three];
    
    three.tabBarItem.badgeValue = @"99+";
    
    //通过设置viewControllers属性添加子控制器
    tabBarVC.viewControllers = @[one,two,three];
    
    //3.把刚刚创建的控制器设置为窗口的根控制器
    self.window.rootViewController = tabBarVC;
    
    
    //4.设置窗口为app的主窗口 并且可见
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
