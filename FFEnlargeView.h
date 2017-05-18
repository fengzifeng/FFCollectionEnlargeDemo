//
//  FFEnlargeView.h
//  FFCollectionEnlargeDemo
//
//  Created by fengzifeng on 2017/5/18.
//  Copyright © 2017年 fengzifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define cellWidth ((ScreenWidth/375.0)*170)
#define cellHeight ((ScreenWidth/375.0)*70)

@interface FFEnlargeView : UIView

+ (instancetype)enlargeView;

@end
