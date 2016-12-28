//
//  myLabel.h
//  GradientColorNav
//
//  Created by steven on 2016/12/26.
//  Copyright © 2016年 steven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface myLabel : UILabel
{
    @private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;

@end
