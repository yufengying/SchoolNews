//
//  BaseInfo.m
//  NewsReader
//  Created by hejinbo on 15/7/7.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//


#import "BaseInfo.h"

@implementation BaseInfo

+ (NSArray *)arrayFromDict:(NSDictionary *)dict
{
    NSArray *array = [dict objectForKey:NetData];
    return [[self class] arrayFromArray:array];
}

+ (NSArray *)arrayFromArray:(NSArray *)array
{
    NSMutableArray *infos = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in array) {
        [infos addObject:[[self class] infoFromDict:dict]];
    }
    
    if (infos.count <= 0) {
        infos = nil;
    }
    
    return infos;
}

+ (instancetype)infoFromDict:(NSDictionary *)dict
{
    BaseInfo *info = [[BaseInfo alloc] init];
    
    info.ID = [dict objectForKey:@"id"];
    info.name = [dict objectForKey:@"name"];
    
    return info;
}

- (NSComparisonResult)compare:(BaseInfo *)bInfo
{
    return [self.ID caseInsensitiveCompare:bInfo.ID];
}

- (BOOL)isEqual:(BaseInfo *)bInfo
{
    return [self.ID isEqualToString:bInfo.ID];
}

@end
