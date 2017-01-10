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
#import <SDWebImage/UIImageView+WebCache.h>

#define kFaceDetailViewCellIdentifier @"kFaceDetailViewCellIdentifier"

@interface BTFFaceDetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)NSMutableArray *images;

@end

@implementation BTFFaceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"表情"];
    [self.view addSubview:self.collectionView];
    [self.collectionView autoPinEdgesToSuperviewEdges];
    self.images = [[NSMutableArray alloc] init];
#if 1
    [self.images addObjectsFromArray:@[@"http://118.178.137.211/storage/app/portray/1/458w41.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/460w28.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/460w29.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/460w30.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/457w49.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/419w24.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/419w25.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/38234.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/38233.jpg",
                                       @"http://118.178.137.211/storage/app/portray/1/38235.jpg"
                                       ]];
#endif
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
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.showsHorizontalScrollIndicator = YES;
        _collectionView.prefetchingEnabled = NO;
        
        // Register our cell
//        [_collectionView registerClass:[BTFFaceDetailCollectionViewCell class] forCellWithReuseIdentifier:kFaceDetailViewCellIdentifier];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kFaceDetailViewCellIdentifier];
    }
    
    return _collectionView;
}

#pragma mark - UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.images.count;
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index path: %ld", (long)indexPath.row);
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFaceDetailViewCellIdentifier forIndexPath:indexPath];
    if (cell) {
        NSLog(@"inner index path: %ld", (long)indexPath.row);
#if 0
        NSString *urlString = self.images[indexPath.row];
        [cell.faceImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
#endif
    }
    return cell;
}

#if 0
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    BTFFaceDetailCollectionViewCell *faceCell = (BTFFaceDetailCollectionViewCell *)cell;
    [faceCell.faceImageView setZoomScale:1.0 animated:YES];
}
#endif

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
