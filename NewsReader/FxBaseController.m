//
//  FxBaseController.m
//  NewsReader
//
//  Created by zhuzhu on 16/1/17.
//  Copyright © 2016年 zhuzhu. All rights reserved.
//

#import "FxBaseController.h"
#import "FxActivityIndicator.h"
#import "FxGlobal.h"
@interface FxBaseController ()

@end

@implementation FxBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarImage];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavBarImage];
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [self setStatusBarStyle:UIStatusBarStyleLightContent];
    
}

- (void)opFail:(NSString *)errorMessage
{
    BASE_ERROR_FUN(errorMessage);
    
}

- (void)opSuccess:(id)data
{
    [self hideIndicator];
}

- (void)setNavBarImage
{
    UIImage *image = [UIImage imageNamed:[FxGlobal isSystemLowIOS7]?
                      @"NavigationBar44.png":@"NavigationBar64.png"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSDictionary *attribute = @{
                                NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationController.navigationBar setTitleTextAttributes:attribute];
}

- (UIButton *)customButton:(NSString *)imageName
                  selector:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)setNavigationLeft:(NSString *)imageName sel:(SEL)sel
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:[self customButton:imageName selector:@selector(doBack:)]];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void)setNavigationRight:(NSString *)imageName
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:[self customButton:imageName selector:@selector(doRight:)]];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setStatusBarStyle:(UIStatusBarStyle)style
{
    [[UIApplication sharedApplication] setStatusBarStyle:style];
}

- (void)setNavigationTitleImage:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    self.navigationItem.titleView = imageView;
}


- (IBAction)doRight:(id)sender
{
    
}

- (IBAction)doBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Activity methods

- (FxActivity *)showActivityInView:(UIView *)view
{
    FxActivity * activity = [[FxActivityIndicator alloc] initWithView:view];
    CGRect frame = view.bounds;
    
    activity.frame = frame;
    [view addSubview:activity];
    activity.labelText = @"";
    
    return activity;
}

- (void)showIndicator:(NSString *)tipMessage
             autoHide:(BOOL)hide
           afterDelay:(BOOL)delay
{
    if (_activity == nil) {
        _activity = [self showActivityInView:self.view];
    }
    
    if (tipMessage != nil) {
        _activity.labelText = tipMessage;
        [_activity show:NO];
    }
    
    if (hide && _activity.alpha>=1.0) {
        if (delay)
            [_activity hide:YES afterDelay:AnimationSecond];
        else
            [_activity hide:YES];
    }
}

- (void)hideIndicator
{
    [_activity hide:YES];
}

@end
