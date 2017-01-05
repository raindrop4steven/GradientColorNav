//
//  BTFFaceDetailViewController.m
//  BeautyFace
//
//  Created by steven on 2016/12/30.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "BTFFaceDetailViewController.h"
#import "BTFFaceDetailCollectionViewCell.h"
#import "XQPhotoView.h"

#define kFaceDetailViewCellIdentifier @"kFaceDetailViewCellIdentifier"

@interface BTFFaceDetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation BTFFaceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"表情"];
    [self.view addSubview:self.collectionView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // CollectionViewFlowLayout
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        [flowlayout setItemSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
        [flowlayout setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        [flowlayout setMinimumLineSpacing:0];
        [flowlayout setMinimumInteritemSpacing:0];
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        // Initialize collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowlayout];
        _collectionView.collectionViewLayout = flowlayout;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        // Register our cell
        [_collectionView registerClass:[BTFFaceDetailCollectionViewCell class] forCellWithReuseIdentifier:kFaceDetailViewCellIdentifier];
    }
    
    return _collectionView;
}

#pragma mark - UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BTFFaceDetailCollectionViewCell *cell = (BTFFaceDetailCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kFaceDetailViewCellIdentifier forIndexPath:indexPath];
    if (cell) {
        NSString *urlString = @"http://ww4.sinaimg.cn/large/7a8aed7bgw1ev1yplngebj20hs0qogq0.jpg";
        XQPhotoView *faceImageView = [XQPhotoView photoViewWithFrame:cell.bounds atImageUrlString:urlString];
        faceImageView.contentMode = UIViewContentModeScaleAspectFit;
        faceImageView.tag = 1001;
        if ([cell viewWithTag:1001] == nil) {
            [cell addSubview:faceImageView];
            [cell.faceImageView autoPinEdgesToSuperviewEdges];
        }
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    BTFFaceDetailCollectionViewCell *faceCell = (BTFFaceDetailCollectionViewCell *)cell;
    [faceCell.faceImageView setZoomScale:1.0 animated:YES];
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
