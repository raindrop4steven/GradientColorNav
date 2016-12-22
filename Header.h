//
//  Header.h
//  GradientColorNav
//
//  Created by steven on 2016/12/8.
//  Copyright © 2016年 steven. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define UIColorFromRGB(rgbValue) \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
    green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
    blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
    alpha:1.0]

#endif /* Header_h */
