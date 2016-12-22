//
//  RecordView.h
//  GradientColorNav
//
//  Created by steven on 2016/12/22.
//  Copyright © 2016年 steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecordView;

@protocol RecordViewDelegate <NSObject>

- (void)RecordView:(RecordView *)recordView didPressedRecordButton:(UIButton *)recordButton;
- (void)RecordView:(RecordView *)recordView didPressedCancelButton:(UIButton *)cancelButton;
- (void)RecordView:(RecordView *)recordView didPressedFinishButton:(UIButton *)finishButton;

@end

@interface RecordView : UIView

@property (nonatomic, strong)UIButton *recordButton;
@property (nonatomic, strong)UISlider *timeSlider;
@property (nonatomic, strong)UILabel *currentTimeLabel;
@property (nonatomic, strong)UILabel *maxTimeLabel;
@property (nonatomic, strong)UIButton *cancelButton;
@property (nonatomic, strong)UIButton *finishButton;
@property (nonatomic, weak)id<RecordViewDelegate> delegate;

@end
