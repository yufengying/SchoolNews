//
//  ViewController.m
//  NewsReader
//
//  Created by zhuzhu on 16/1/14.
//  Copyright © 2016年 zhuzhu. All rights reserved.
//

#import "HomePage.h"
#import "AdvertInfo.h"
#import "ColumnInfo.h"
#import "PageInfo.h"
#import "NewsPage.h"
#import "VoicePage.h"
#import "ReaderPage.h"
#import "DiscoveryPage.h"
#import "MyPage.h"

@implementation HomePage

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self addTabControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)addTabControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    
    self.viewControllers = [PageInfo pageControllers];
    
}

@end
