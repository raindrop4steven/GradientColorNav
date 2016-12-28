//
//  ImageViewController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/28.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageCollectionViewCell.h"

#define kImageCollectionViewCellIdentifier @"kImageCollectionViewCellIdentifier"

@interface ImageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView autoPinEdgesToSuperviewEdges];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*0.8);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:kImageCollectionViewCellIdentifier];
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell * )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell  *cell = (ImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kImageCollectionViewCellIdentifier forIndexPath:indexPath];
    if (cell) {
        cell.imageView.image = [UIImage imageNamed:@"flower"];
    }

    return cell;
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
