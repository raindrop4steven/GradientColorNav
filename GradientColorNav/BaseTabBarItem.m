//
//  BaseTabBarItem.m
//  GradientColorNav
//
//  Created by steven on 2016/12/9.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "BaseTabBarItem.h"

@implementation BaseTabBarItem

- (id)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self = [super initWithTitle:title image:image selectedImage:selectedImage];
    if (self) {
        self.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
    }
    
    return self;
}
@end
