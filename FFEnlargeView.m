//
//  FFEnlargeView.m
//  FFCollectionEnlargeDemo
//
//  Created by fengzifeng on 2017/5/18.
//  Copyright © 2017年 fengzifeng. All rights reserved.
//

#import "FFEnlargeView.h"
#import "FFLineLayoutView.h"
#import "FFCollectionViewCell.h"

static NSString *cellIdentifier = @"cell";

@interface FFEnlargeView () <UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *_collectionView;
}

@end

@implementation FFEnlargeView

+ (instancetype)enlargeView
{
    FFEnlargeView *view = [[FFEnlargeView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, [FFEnlargeView viewHeight])];
    
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
        [self layoutIfNeeded];
        [_collectionView reloadData];
        [self scrollsToIndex:1];
    }
    
    return self;
}

- (void)setupViews
{
    FFLineLayoutView *layout = [[FFLineLayoutView alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth, cellHeight) collectionViewLayout:layout];
    [_collectionView registerClass:[FFCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_collectionView];
}

- (void)scrollsToIndex:(NSInteger)index
{
    CGPoint correctPoint = [_collectionView.collectionViewLayout targetContentOffsetForProposedContentOffset:CGPointMake(cellWidth*index, 0) withScrollingVelocity:CGPointZero];
    _collectionView.contentOffset = correctPoint;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(cellWidth/1.05 , cellHeight/1.05);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

+ (float)viewHeight
{
    return cellHeight;
}


@end
