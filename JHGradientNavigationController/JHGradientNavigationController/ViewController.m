//
//  ViewController.m
//  JHGradientNavigationController
//
//  Created by HaoCold on 2020/1/10.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,  strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.jh_navigationBar];
    
    self.jh_navigationBar.titleLabel.text = @"渐变导航栏";
    self.jh_navigationBar.alphaBlock = ^(JHGradientNavigationBar *bar, BOOL highlight) {
        if (highlight) {
            // 不透明
            //bar.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        }else{
            // 透明
            //bar.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        }
    };
}

#pragma mark --- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat alpha = scrollView.contentOffset.y/64;
    [self subViewDidScrollWithAlpha:alpha];
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.frame = self.view.bounds;
        scrollView.delegate = self;
        scrollView.backgroundColor = [UIColor brownColor];
        scrollView.contentSize = CGSizeMake(0, CGRectGetHeight(self.view.frame)*1.5);
        _scrollView = scrollView;
    }
    return _scrollView;
}

@end
