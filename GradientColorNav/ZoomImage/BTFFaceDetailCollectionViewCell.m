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
        self.faceImageView = [[XQPhotoView alloc] initWithFrame:self.bounds];
        self.faceImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:self.faceImageView];
    }
    
    return self;
}

@end
