//
//  BaseDataController.h
//  GradientColorNav
//
//  Created by steven on 2016/12/9.
//  Copyright © 2016年 steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface BaseDataController : NSObject

@property (nonatomic, strong)FMDatabase *db;
@property (nonatomic, strong)FMDatabaseQueue *queue;

- (BOOL)createTable:(NSDictionary *)tableDictionary;

@end
