//
//  AppDelegate.h
//  NewsReader
//
//  Created by zhuzhu on 16/1/14.
//  Copyright © 2016年 zhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
+ (AppDelegate *)appDeg;
- (void)showHomePage;
- (void)showNewsPage;
@end

