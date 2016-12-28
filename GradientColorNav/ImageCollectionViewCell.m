//
//  ImageCollectionViewCell.m
//  GradientColorNav
//
//  Created by steven on 2016/12/28.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self.imageView autoPinEdgesToSuperviewEdges];
    }
    
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _imageView;
}
@end
