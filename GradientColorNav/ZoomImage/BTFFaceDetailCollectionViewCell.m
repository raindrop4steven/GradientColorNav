//
//  BTFFaceDetailCollectionViewCell.m
//  BeautyFace
//
//  Created by steven on 2016/12/30.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "BTFFaceDetailCollectionViewCell.h"
#import "XQPhotoView.h"

@implementation BTFFaceDetailCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
#if 0
        NSString *urlString = @"http://ww4.sinaimg.cn/large/7a8aed7bgw1ev1yplngebj20hs0qogq0.jpg";
        
        /** 加载网络图片 */
        self.faceImageView = [XQPhotoView photoViewWithFrame:self.bounds atImageUrlString:urlString];
        self.faceImageView = [[XQPhotoView alloc] init];
        self.faceImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.faceImageView];
        [self.faceImageView autoPinEdgesToSuperviewEdges];
#endif
    }
    
    return self;
}

@end
