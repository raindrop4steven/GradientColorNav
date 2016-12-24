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
        [self.layer setMasksToBounds:YES];
        [self addSubview:self.controlView];
        [self.controlView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
        [self.controlView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
        [self.controlView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
        [self.controlView autoSetDimension:ALDimensionHeight toSize:40];
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
