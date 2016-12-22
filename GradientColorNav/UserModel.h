//
//  UserModel.h
//  GradientColorNav
//
//  Created by steven on 2016/12/9.
//  Copyright © 2016年 steven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (assign)NSInteger userId;
@property (nonnull, nonatomic, strong)NSString *name;
@property (assign)NSInteger age;
@property (nonnull, nonatomic, strong)NSDate *date;

@end
