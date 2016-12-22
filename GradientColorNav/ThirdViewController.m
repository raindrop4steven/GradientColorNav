//
//  ThirdViewController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/8.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ThirdViewController.h"
#import "GradientView.h"

@interface ThirdViewController ()

@property (nonatomic, strong)GradientView *headerView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Profile"];
    
    self.headerView = [[GradientView alloc] init];
    [self.headerView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 0.5)];

    [self.view addSubview:self.headerView];
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
