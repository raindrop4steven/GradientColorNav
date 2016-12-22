//
//  BaseDataController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/9.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "BaseDataController.h"

#define DATABASE_NAME @"data.db"

@implementation BaseDataController

- (FMDatabase *)db {
    if (!_db) {
        _db = [self createDatabaseWithName:DATABASE_NAME];
        [_db open];
        [_db close];
    }
    
    return _db;
}

- (FMDatabaseQueue *)queue {
    if (!_queue) {
        _queue = [self createQueueWithName:DATABASE_NAME];
    }
    
    return _queue;
}

#pragma mark - Create database with name
- (FMDatabase *)createDatabaseWithName:(NSString *)name {
    NSString *path = [self getDatabasePathWithName:name];
    return [FMDatabase databaseWithPath:path];
}

#pragma mark - Create queue with name
- (FMDatabaseQueue *)createQueueWithName:(NSString *)name {
    NSString *path = [self getDatabasePathWithName:name];
    return [FMDatabaseQueue databaseQueueWithPath:path];
}

#pragma mark - Create tables
- (BOOL)createTable:(NSDictionary *)tableDictionary {
    NSString *tableName = (NSString *)[tableDictionary objectForKey:@"tableName"];
    NSString *tableStatement = (NSString *)[tableDictionary objectForKey:@"tableStatement"];
    
    // Flag to indicate if creation sucess
    BOOL success = FALSE;
    
    if (![self.db open]) {
        NSLog(@"Open database error : %@", [self.db lastError]);
    } else {
        // Check if tableName exists
        NSInteger count = [self.db intForQuery:@"SELECT COUNT(*) FROM sqlite_master WHERE type=? AND name=?", @"table", tableName];
        
        // Create table if not exists
        if (count == 0) {
            success = [self.db executeUpdate:tableStatement];
        } else {
            success = TRUE;
        }
        
        [self.db close];
    }
    
    return success;
}

#pragma mark - Get database path
- (NSString *)getDatabasePathWithName:(NSString *)name {
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [array objectAtIndex:0];
    
    // TODO: Get unique userId from userdefaults
    // NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    NSString *userId = @"1";
    
    NSString *userDirectory = [documentsDirectory stringByAppendingPathComponent:userId];
    
    NSError *error = nil;
    BOOL isDirectory = YES;
    if (![[NSFileManager defaultManager] fileExistsAtPath:userDirectory isDirectory:&isDirectory]) {
        // Create user folder
        [[NSFileManager defaultManager] createDirectoryAtPath:userDirectory
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:&error];
        if (!error) {
            NSLog(@"Create folder success");
        }
    }
    // db path
    NSString *path = [[documentsDirectory stringByAppendingPathComponent:userId] stringByAppendingPathComponent:name];
    
    NSLog(@"%@", path);
    
    return path;
}


@end
