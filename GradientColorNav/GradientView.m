//
//  GradientView.m
//  GradientColorNav
//
//  Created by steven on 2016/12/11.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "GradientView.h"

@implementation GradientView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAGradientLayer *gradient = [self graidentLayer];
    [self.layer insertSublayer:gradient atIndex:0];
}

- (CAGradientLayer *)graidentLayer {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.frame;
    gradient.colors = [NSArray arrayWithObjects:(id)UIColorFromRGB(0xD394BF).CGColor,
                       (id)UIColorFromRGB(0x938DC5).CGColor, nil];
    [gradient setStartPoint:CGPointMake(0.0, 0.5)];
    [gradient setEndPoint:CGPointMake(1.0, 0.5)];
    return gradient;
}

- (UIImage *)imageFromLayer:(CALayer *)layer {
    UIGraphicsBeginImageContext(layer.frame.size);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}
@end
