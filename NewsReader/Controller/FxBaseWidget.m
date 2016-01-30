//
//  FxBaseWidget.m
//  NewsReader
//
//  Created by hejinbo on 15/7/7.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

#import "FxBaseWidget.h"

@implementation FxBaseWidget

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self reloadData];
}

- (void)updateUI
{
    
}

- (void)reloadData
{
    if (![self isReloadLocalData]) {
        [self requestServer];
    }
    else {
        [self requestServerOp];
        [self updateUI];
    }
}

- (BOOL)isReloadLocalData
{
    BOOL isReload = self.listData.count > 0;
    
    if (isReload) {
        [self updateUI];
    }
    
    return isReload;
}

- (void)requestServer
{
    [self showIndicator:LoadingTip autoHide:YES afterDelay:YES];
    [self requestServerOp];
}

- (void)requestServerOp
{
}

@end
