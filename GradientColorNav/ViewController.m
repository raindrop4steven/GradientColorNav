//
//  ViewController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/8.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ViewController.h"

#define kTableViewCellIdentifer @"kTableViewCellIdentifer"
#define kHeight 160

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonnull, nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = self.view.frame;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(kHeight, 0, 0, 0);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellIdentifer];
    [self.view addSubview:self.tableView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header.jpg"]];
    imageView.frame = CGRectMake(0, -kHeight, self.view.frame.size.width, kHeight);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.tag = 101;
    [self.tableView addSubview:imageView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifer forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    
    NSLog(@"%f", point.y);
    if (point.y < -kHeight) {
        CGRect rect = [self.tableView viewWithTag:101].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        [self.tableView viewWithTag:101].frame = rect;
    }
    
    if (point.y < -320) {
        point.y = -320;
        scrollView.contentOffset = CGPointMake(point.x, point.y);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
