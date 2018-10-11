//
//  FFCollectionViewCell.m
//  FFCollectionEnlargeDemo
//
//  Created by fengzifeng on 2017/5/18.
//  Copyright © 2017年 fengzifeng. All rights reserved.
//

#import "FFCollectionViewCell.h"
#import "UIView+Addition.h"

@interface FFCollectionViewCell ()

@property (strong, nonatomic) UIImageView *bgImageView;

@end

@implementation FFCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    
    if (self){
        [self.contentView addSubview:self.bgImageView];
    }
    
    return self;
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.fWidth, self.fHeight)];
        _bgImageView.image = [UIImage imageNamed:@"welfare_posttopic"];

    }
    
    return _bgImageView;
}


@end
