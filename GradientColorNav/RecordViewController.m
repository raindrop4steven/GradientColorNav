//
//  RecordViewController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/22.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.recordView];
    [self.recordView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.recordView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:150];
    [self.recordView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [self.recordView autoSetDimension:ALDimensionHeight toSize:160];
    
}

- (RecordView *)recordView {
    if (!_recordView) {
        _recordView = [[RecordView alloc] init];
        _recordView.layer.borderColor = [UIColor grayColor].CGColor;
        _recordView.layer.borderWidth = 2;
    }
    
    return _recordView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
