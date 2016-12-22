//
//  ScrollTableViewViewController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/17.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ScrollTableViewViewController.h"

@interface ScrollTableViewViewController ()

@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIView *view1, *view2, *view3;

@end

@implementation ScrollTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add contentView
    [self.view addSubview:self.scrollView];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height)];
    
    self.view1 = [[UIView alloc] initWithFrame:self.view.frame];
    self.view1.backgroundColor = [UIColor redColor];
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view2.backgroundColor = [UIColor greenColor];
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view3.backgroundColor = [UIColor purpleColor];
    
    [self.scrollView addSubview:self.view1];
    [self.scrollView addSubview:self.view2];
    [self.scrollView addSubview:self.view3];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

#pragma mark - Getter for scrollView
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setShowsHorizontalScrollIndicator:YES];
        [_scrollView setShowsVerticalScrollIndicator:YES];
    }
    
    return _scrollView;
}

#pragma mark - Getter for contentView
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    
    return _contentView;
}

- (void)addChildViews:(NSArray *)viewArrays {
    NSInteger pages = viewArrays.count;
    
    UIView *childView = nil;
    UIView *preChild = nil;
    for (int i = 0; i < pages; i++) {
        childView = [viewArrays objectAtIndex:i];
        
        [self.scrollView addSubview:childView];
        
        [childView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view];
        [childView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [childView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        if (!preChild) {
            // First childView will align to contentView
            [childView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        } else {
            // Subsequent childviews just align to its previous one
            [childView autoConstrainAttribute:ALAttributeLeading toAttribute:ALAttributeTrailing ofView:preChild];
        }
        
        if (i == pages - 1) {
            // Last page will align to right edge
            [childView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        }
        [childView setBackgroundColor:[UIColor redColor]];
        preChild = childView;
    }
    
    self.scrollView.contentOffset = CGPointZero;
    
}

@end
