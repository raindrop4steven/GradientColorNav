//
//  BTFFaceDetailCollectionViewCell.h
//  BeautyFace
//
//  Created by steven on 2016/12/30.
//  Copyright © 2016年 steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XQPhotoView;

@interface BTFFaceDetailCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)NSString *url;
@property (nonatomic, strong)XQPhotoView *faceImageView;

@end
