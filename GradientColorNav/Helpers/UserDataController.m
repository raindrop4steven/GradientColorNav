//
//  UserDataController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/9.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "UserDataController.h"

@implementation UserDataController

+ (instancetype)instance {
    static UserDataController *userDataController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userDataController = [[UserDataController alloc] init];
    });
    
    return userDataController;
}

- (BOOL)insertUser:(UserModel *)user {
    BOOL success = FALSE;
    if (![self.db open]) {
        NSLog(@"Open database failed");
    } else {
        success = [self.db executeUpdate:@"INSERT INTO users (uid, name, age, date) VALUES (?, ?, ?, ?)",
                        [NSNumber numberWithInteger:user.userId],
                        user.name,
                        [NSNumber numberWithInteger:user.age],
                        [self stringFromDate:user.date]];
        [self.db close];
    }
    return success;
}

- (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    return [dateFormatter stringFromDate:date];
}

- (NSArray *)getAllUsers {
    NSMutableArray *users = [[NSMutableArray alloc] init];
    // Query data
    NSString *queryString = [NSString stringWithFormat:@"SELECT id, name, age, date FROM users ORDER BY date DESC"];
    
    if (![self.db open]) {
        NSLog(@"Open database error!");
    }else {
        FMResultSet *resultSet = [self.db executeQuery:queryString];
        while (resultSet.next) {
            UserModel *user = [[UserModel alloc] init];
            user.userId = [resultSet intForColumn:@"id"];
            user.name = [resultSet stringForColumn:@"name"];
            user.age = [resultSet longForColumn:@"age"];
            user.date = [resultSet dateForColumn:@"date"];
            [users addObject:user];
        }
        NSLog(@"Users count: %ld", users.count);
    }
    [self.db close];
    
    return users;
}

@end
