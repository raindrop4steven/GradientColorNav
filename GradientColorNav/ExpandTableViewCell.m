//
//  ExpandTableViewCell.m
//  GradientColorNav
//
//  Created by steven on 2016/12/24.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ExpandTableViewCell.h"

@implementation ExpandTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.controlView];
    }
    
    return self;
}

- (UIView *)controlView {
    if (!_controlView) {
        _controlView = [[UIView alloc] init];
        _controlView.backgroundColor = [UIColor greenColor];
    }
    
    return _controlView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
