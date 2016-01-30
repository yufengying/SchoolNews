//
//  UserInfo.m
//  NewsReader
//
//  Created by zhuzhu on 16/1/17.
//  Copyright © 2016年 zhuzhu. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+(UserInfo *) infoFromDict:(NSDictionary *)dict
{
    UserInfo *info = [[UserInfo alloc]init];
    info.ID = [dict objectForKey:@"id"];
    info.name = [dict objectForKey:@"name"];
    info.token = [dict objectForKey:@"token"];
    return info; 
}

@end
