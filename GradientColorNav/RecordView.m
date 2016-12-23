//
//  RecordView.m
//  GradientColorNav
//
//  Created by steven on 2016/12/22.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "RecordView.h"

@implementation RecordView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.recordButton];
        
        [self addSubview:self.currentTimeLabel];

        [self addSubview:self.maxTimeLabel];
        
        [self addSubview:self.timeSlider];
        
        [self addSubview:self.cancelButton];
        
        [self addSubview:self.finishButton];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.recordButton autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:self withOffset:10];
    [self.recordButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:10];
    [self.recordButton autoSetDimensionsToSize:CGSizeMake(self.frame.size.height/2-20,self.frame.size.height/2-20)];
    [self.recordButton.layer setCornerRadius:(self.frame.size.height/2-20)/2];
    [self.recordButton.layer setMasksToBounds:YES];
    
    
    [self.currentTimeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.recordButton];
    [self.currentTimeLabel autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.recordButton withOffset:10];
    [self.currentTimeLabel autoSetDimension:ALDimensionWidth toSize:50];
    [self.currentTimeLabel setBackgroundColor:[UIColor redColor]];
    
    [self.maxTimeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.recordButton];
    [self.maxTimeLabel autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:self withOffset:-10];
    
    [self.timeSlider autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.recordButton];
    [self.timeSlider autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.currentTimeLabel withOffset:10];
    [self.timeSlider autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:self.maxTimeLabel withOffset:-10];
    
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.cancelButton autoSetDimensionsToSize:CGSizeMake(self.frame.size.width/2, self.frame.size.height/2)];
    
    [self.finishButton autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [self.finishButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.finishButton autoSetDimensionsToSize:CGSizeMake(self.frame.size.width/2, self.frame.size.height/2)];
}

#pragma mark - record button action
- (void)clickRecordButton {
    if ([self.delegate respondsToSelector:@selector(RecordView:didPressedRecordButton:)]) {
        [self.delegate RecordView:self didPressedRecordButton:self.recordButton];
    }
}

#pragma mark - cancel button action
- (void)clickCancelButton {
    if ([self.delegate respondsToSelector:@selector(RecordView:didPressedCancelButton:)]) {
        [self.delegate RecordView:self didPressedCancelButton:self.cancelButton];
    }
}

#pragma mark - finish button action
- (void)clickFinishButton {
    if ([self.delegate respondsToSelector:@selector(RecordView:didPressedFinishButton:)]) {
        [self.delegate RecordView:self didPressedFinishButton:self.finishButton];
    }
}

#pragma mark - getter for record button
- (UIButton *)recordButton {
    if (!_recordButton) {
        _recordButton = [[UIButton alloc] init];
        [_recordButton setTitle:@"录音" forState:UIControlStateNormal];
        _recordButton.backgroundColor = [UIColor blueColor];
        [_recordButton addTarget:self action:@selector(clickRecordButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _recordButton;
}

#pragma mark - getter for current time label
- (UILabel *)currentTimeLabel {
    if (!_currentTimeLabel) {
        _currentTimeLabel = [[UILabel alloc] init];
        _currentTimeLabel.text = @"00:00";
    }
    
    return _currentTimeLabel;
}

#pragma mark - getter for max time label
- (UILabel *)maxTimeLabel {
    if (!_maxTimeLabel) {
        _maxTimeLabel = [[UILabel alloc] init];
        _maxTimeLabel.text = @"05:00";
    }
    
    return _maxTimeLabel;
}

#pragma mark - getter for slider
- (UISlider *)timeSlider {
    if (!_timeSlider) {
        _timeSlider = [[UISlider alloc] init];
        _timeSlider.minimumValue = 0;
        _timeSlider.maximumValue = 5*60;
    }
    
    return _timeSlider;
}

#pragma mark - Cancel button
- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.backgroundColor = [UIColor greenColor];
        [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cancelButton;
}

#pragma mark - Finish button
- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton = [[UIButton alloc] init];
        [_finishButton setTitle:@"完成" forState:UIControlStateNormal];
        _finishButton.backgroundColor = [UIColor redColor];
        [_finishButton addTarget:self action:@selector(clickFinishButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _finishButton;
}

@end
