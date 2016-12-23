//
//  RecordViewController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/22.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "RecordViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Mp3Recorder.h"
#import "MSWeakTimer.h"

@interface RecordViewController ()<Mp3RecorderDelegate, RecordViewDelegate>

@property (nonatomic, strong)Mp3Recorder *mp3Recorder;
@property (nonatomic, strong)MSWeakTimer *recordTimer;
@property (nonatomic, strong)NSData *recordData;
@property (nonatomic, strong)NSString *voicePath;
@property (nonatomic, assign)CGFloat recordTime;
@property (nonatomic, assign)BOOL isRecording;

@property (nonatomic, strong)UIButton *recordButton;

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.recordView];
    [self.recordView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.recordView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:150];
    [self.recordView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [self.recordView autoSetDimension:ALDimensionHeight toSize:160];
    
    [self.view addSubview:self.recordButton];
    [self.recordButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.recordButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view withOffset:-120];
    [self.recordButton autoSetDimensionsToSize:CGSizeMake(150, 50)];
    // set up record
    self.mp3Recorder = [[Mp3Recorder alloc] initWithDelegate:self];
    self.isRecording = NO;
    self.recordTime = 0;
    
}

#pragma mark - record button
- (UIButton *)recordButton {
    if (!_recordButton) {
        _recordButton = [[UIButton alloc ]init];
        _recordButton.backgroundColor = [UIColor greenColor];
        [_recordButton setTitle:@"点我" forState:UIControlStateNormal];
        [_recordButton addTarget:self action:@selector(beginRecordVoice) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _recordButton;
}
#pragma mark - record view
- (RecordView *)recordView {
    if (!_recordView) {
        _recordView = [[RecordView alloc] init];
        _recordView.delegate = self;
        _recordView.layer.borderColor = [UIColor grayColor].CGColor;
        _recordView.layer.borderWidth = 2;
    }
    
    return _recordView;
}

#pragma mark - 录音touch事件
- (void)beginRecordVoice
{
    [self.mp3Recorder startRecord];
    [self.recordView.recordButton setTitle:@"暂停" forState:UIControlStateNormal];
    self.isRecording = YES;
    self.recordTime = 0.00;
    self.recordTimer = [MSWeakTimer scheduledTimerWithTimeInterval:0.01
                                                      target:self
                                                    selector:@selector(countVoiceTime)
                                                    userInfo:nil
                                                     repeats:YES
                                               dispatchQueue:dispatch_get_main_queue()];

}

- (void)endRecordVoice
{
    NSLog(@"stop record");
    if (self.recordTimer) {
        [_mp3Recorder stopRecord];
        self.isRecording = NO;
        [self.recordTimer invalidate];
        self.recordTimer = nil;
    }
}

- (void)countVoiceTime {
    self.recordTime += 0.01;
    self.recordView.currentTimeLabel.text = [self timeFromTotalSeconds:self.recordTime];
    [self.recordView.timeSlider setValue:self.recordTime];
}

#pragma mark - Get min:sec format time from total seconds
- (NSString *)timeFromTotalSeconds:(CGFloat)totalSeconds {
    NSInteger min = (int)floorf(totalSeconds/60);
    NSInteger sec = (int)floorf(totalSeconds-min*60);
    
    NSLog(@"%02ld:%02ld", min, sec);
    return [NSString stringWithFormat:@"%02ld:%02ld", min, sec];
}

#pragma mark - RecordViewDelegate
- (void)RecordView:(RecordView *)recordView didPressedRecordButton:(UIButton *)recordButton {
    // is recording, should stop
    if (self.isRecording) {
        // stop recording first
        [self.mp3Recorder pauseRecord];
        
        // change record button bgimage
        [recordView.recordButton setTitle:@"继续" forState:UIControlStateNormal];
    } else {
        // Ask record permission here explicitly
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // is ready, should recording
                    [self.mp3Recorder resumeRecord];
                    [recordView.recordButton setTitle:@"暂停" forState:UIControlStateNormal];
                });
            }else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // record permission denied.
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"未开启录音权限" message:@"您需要允许录音权限才可以录音" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"不开启" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                        NSLog(@"You pressed button OK");
                    }];
                    UIAlertAction *settingAction = [UIAlertAction actionWithTitle:@"开启" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        NSLog(@"You pressed open setting");
                        // open settings app
                        NSURL *settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                        [[UIApplication sharedApplication] openURL:settingURL];
                    }];
                    
                    [alertController addAction:defaultAction];
                    [alertController addAction:settingAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                });
            }
        }];
    }
    self.isRecording = !self.isRecording;
}

- (void)RecordView:(RecordView *)recordView didPressedCancelButton:(UIButton *)cancelButton {
    NSLog(@"Cancel record");
    [_mp3Recorder cancelRecord];
}

- (void)RecordView:(RecordView *)recordView didPressedFinishButton:(UIButton *)finishButton {
    NSLog(@"Finish record");
    [self endRecordVoice];
}

#pragma mark - mp3Recorder delegate
//回调录音资料
- (void)endConvertWithData:(NSData *)voiceData voicePath:(NSString *)path
{
    self.recordData = voiceData;
    self.voicePath = path;
    NSLog(@"end convert record data");
    NSLog(@"Path %@", self.voicePath);
}

// Begin convert to other form audio, for android example
- (void)beginConvert {
    
}

- (void)failRecord
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
