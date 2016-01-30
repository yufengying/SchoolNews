//
//  FxLogin.m
//  NewsReader
//
//  Created by zhuzhu on 16/1/17.
//  Copyright © 2016年 zhuzhu. All rights reserved.
//

#import "FxLogin.h"
#import "UserInfo.h"

@implementation FxLogin

- (void)parseSuccess:(NSDictionary *)dict jsonString:jsonString
{
    NSDictionary *dictData = [dict objectForKey:NetData];
    
    UserInfo *info  = [UserInfo infoFromDict:dictData];
    
    [_delegate opSuccess:info];
}

@end
