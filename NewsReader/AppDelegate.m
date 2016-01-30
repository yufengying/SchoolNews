//
//  AppDelegate.m
//  NewsReader
//
//  Created by zhuzhu on 16/1/14.
//  Copyright © 2016年 zhuzhu. All rights reserved.
//

#import "AppDelegate.h"
#import "Defines.h"
#import "LoginPage.h"
#import "AdvertPage.h"
#import "HomePage.h"
#import "NewsPage.h"
#import "FxGlobal.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)appDeg
{
    return  (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)showHomePage
{
    LoginPage *page = [[LoginPage alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:page];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
}

- (void)showNewsPage
{
    NewsPage *page = [[NewsPage alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:page];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
}

- (void)showAdvertPage
{
    self.window.rootViewController = [[AdvertPage alloc]init];
    [self.window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [AdvertPage showAdvertPage];
    
    //不备份到icloud
    NSString *filePath = [FxGlobal getRootPath];
    [FxGlobal setNotBackUp:filePath];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    if ([AdvertPage canShowAdvertPage]) {
        [AdvertPage showAdvertPage];
    }
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
