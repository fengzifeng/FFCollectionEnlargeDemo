//
//  FFLineLayoutView.m
//  FFCollectionEnlargeDemo
//
//  Created by fengzifeng on 2017/5/18.
//  Copyright © 2017年 fengzifeng. All rights reserved.
//

#import "FFLineLayoutView.h"
#import "FFEnlargeView.h"

@implementation FFLineLayoutView

- (void)prepareLayout
{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 10;
    CGFloat inset = (self.collectionView.frame.size.width - cellWidth) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(self.sectionInset.top,
                                         inset,
                                         self.sectionInset.top,
                                         inset);
    
    [super prepareLayout];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    CGFloat scale = 0.05; //调节值
    NSArray *superAttributes = [super layoutAttributesForElementsInRect:rect];
    NSArray *attributes = [[NSArray alloc] initWithArray:superAttributes copyItems:YES];
    
    CGRect visibleRect = CGRectMake(self.collectionView.contentOffset.x,
                                    self.collectionView.contentOffset.y,
                                    self.collectionView.frame.size.width,
                                    self.collectionView.frame.size.height);
    CGFloat offset = CGRectGetMidX(visibleRect);
    
    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attribute, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat distance = offset - attribute.center.x;
        CGFloat scaleForDistance = distance / self.itemSize.height;
        CGFloat scaleForCell = 1 + scale * (1 - fabs(scaleForDistance));
        
        // 仅仅操作y
        attribute.transform3D = CATransform3DMakeScale(1, scaleForCell, 1);
        attribute.zIndex = 1;
    }];
    
    return attributes;
}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attributes in array) {
        if (ABS(minDelta) > ABS(attributes.center.x - centerX)) {
            minDelta = attributes.center.x - centerX;
        }
    }
    
    proposedContentOffset.x += minDelta;
    proposedContentOffset.x = proposedContentOffset.x<0?0:proposedContentOffset.x;
    proposedContentOffset.x = proposedContentOffset.x>floor(self.collectionView.contentSize.width - ScreenWidth)?floor(self.collectionView.contentSize.width - ScreenWidth):proposedContentOffset.x;
    
    return proposedContentOffset;
}

@end
