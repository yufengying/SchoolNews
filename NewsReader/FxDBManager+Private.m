//
//  FxDBManager+Private.m
//  FxHejinbo
//
//  Created by hejinbo on 15/5/13.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

//#import "FxDBManager+Private.h"
//#import <FxDB/FxDB.h>
//
//@implementation FxDBManager (Private)
//
//// 将内容存储到指定数据库的表中
///*
// *content：要存储的内容
// *primaryKey：表主键,不能为nil
// *otherFields:表字段名称，不包含主键,统一为TEXT数据类型
// *tableName：表名称
// *dbFile：数据库文件，路径+文件名
// */
//+ (void)save:(NSDictionary *)dictContent
//  primaryKey:(NSString *)primaryKey
//     inTable:(NSString *)tableName
//    inDBFile:(NSString *)dbFile
//{
//    if (dictContent == nil) {
//        BASE_INFO_FUN(@"保存内容为空");
//        return;
//    }
//    if (primaryKey.length <= 0) {
//        BASE_ERROR_FUN(@"表主键不能为空");
//        return;
//    }
//    
//    FxDatabaseQueue *queue = [FxDatabaseQueue databaseQueueWithPath:dbFile];
//    
//    [queue inTransaction:^(FxDatabase *db, BOOL *rollback) {
//        
//        NSMutableString *values = [[NSMutableString alloc] init];
//        NSMutableString *field = [[NSMutableString alloc] init];
//        
//        //首先加入主键
//        [values appendFormat:@"'%@'", [dictContent objectForKey:primaryKey]];
//        [field appendFormat:@"%@ TEXT PRIMARY KEY", primaryKey];
//        for (NSString *key in dictContent) {
//            if ([key isEqualToString:primaryKey]) {
//                continue;
//            }
//            
//            [values appendFormat:@",'%@'", [dictContent objectForKey:key]];
//            [field appendFormat:@",%@ TEXT", key];
//        }
//        
//        NSString *createSqlFmt = @"CREATE TABLE IF NOT EXISTS %@ (%@)";
//        NSString *createSql = [NSString stringWithFormat:createSqlFmt, tableName, field];
//        
//        BOOL result = [db executeUpdate:createSql];
//        if (result) {
//            NSString *insertSqlFmt = @"INSERT OR REPLACE INTO %@ values(%@)";
//            result = [db executeUpdate: [NSString stringWithFormat:insertSqlFmt, tableName, values] ];
//        }
//        
//        if (!result) {
//            BASE_ERROR_FUN(([NSString stringWithFormat: @"%@ 创建或插入数据错误", tableName]));
//        }
//    }];
//    
//    [queue close];
//}
//
//// condition格式为：{Key:Value}
//+ (NSArray *)fetchWithCondition:(NSDictionary *)dictCondition
//                           forFields:(NSArray *)fields
//                             inTable:(NSString *)tableName
//                            inDBFile:(NSString *)dbFile
//{
//    NSMutableArray *contents = [[NSMutableArray alloc] init];
//    FxDatabaseQueue *queue = [FxDatabaseQueue databaseQueueWithPath:dbFile];
//    
//    [queue inTransaction:^(FxDatabase *db, BOOL *rollback) {
//        
//        NSMutableString *sql = [[NSMutableString alloc] init];
//        [sql appendFormat:@"SELECT * FROM %@", tableName];
//        
//        NSInteger index = 0;
//        NSString *condition = nil;
//        for (NSString *key in dictCondition) {
//            if (index == 0) {
//                [sql appendString:@" WHERE "];
//            }
//            else {
//                [sql appendString:@" AND "];
//            }
//            
//            condition = [dictCondition objectForKey:key];
//            if ([condition isKindOfClass:[NSString class]]) {
//                [sql appendFormat:@"%@='%@'",key,condition];
//            }
//            else {
//                [sql appendFormat:@"%@=%@",key,condition];
//            }
//            
//            index++;
//        }
//        
//        FxResultSet *rs = [db executeQuery: sql];
//        NSMutableDictionary *dictRow= nil;
//        while ([rs next]) {
//            dictRow = [[NSMutableDictionary alloc] init];
//            for (NSString *key in fields) {
//                [dictRow setObject:[rs stringForColumn:key] forKey:key];
//            }
//            
//            [contents addObject:dictRow];
//        }
//    }];
//    
//    [queue close];
//    
//    return contents;
//}
//
//+ (void)deleteWithCondition:(NSDictionary *)dictCondition
//                    inTable:(NSString *)tableName
//                   inDBFile:(NSString *)dbFile
//{
//    FxDatabaseQueue *queue = [FxDatabaseQueue databaseQueueWithPath:dbFile];
//    
//    [queue inTransaction:^(FxDatabase *db, BOOL *rollback) {
//        
//        NSMutableString *sql = [[NSMutableString alloc] init];
//        [sql appendFormat:@"DELETE FROM %@", tableName];
//        
//        NSInteger index = 0;
//        for (NSString *key in dictCondition) {
//            if (index == 0) {
//                [sql appendString:@" WHERE "];
//            }
//            else {
//                [sql appendString:@" AND "];
//            }
//            
//            [sql appendFormat:@"%@='%@'",key,[dictCondition objectForKey:key]];
//            index++;
//        }
//        
//        BOOL result = [db executeUpdate:sql];
//        if (!result) {
//            BASE_ERROR_FUN(([NSString stringWithFormat: @"%@ 删除数据错误", tableName]));
//        }
//    }];
//    
//    [queue close];
//}
//
//@end
