//
//  ViewController.m
//  FFCollectionEnlargeDemo
//
//  Created by fengzifeng on 2017/5/18.
//  Copyright © 2017年 fengzifeng. All rights reserved.
//

#import "ViewController.h"
#import "FFEnlargeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:[FFEnlargeView enlargeView]];
}

@end
