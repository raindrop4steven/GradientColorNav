//
//  XQPotoView.h
//  测试
//
//  Created by 格式化油条 on 15/8/15.
//  Copyright (c) 2015年 XQBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQPhotoView : UIScrollView

@property (strong, nonatomic) UIImageView *imageView;

- (void)setCellImageWithUrl:(NSString *)url;

@end
