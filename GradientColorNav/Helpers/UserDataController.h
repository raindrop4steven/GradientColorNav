//
//  UserDataController.h
//  GradientColorNav
//
//  Created by steven on 2016/12/9.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "BaseDataController.h"
#import "UserModel.h"

@interface UserDataController : BaseDataController

+ (instancetype)instance;
- (BOOL)insertUser:(UserModel *)user;
- (NSArray *)getAllUsers;

@end
