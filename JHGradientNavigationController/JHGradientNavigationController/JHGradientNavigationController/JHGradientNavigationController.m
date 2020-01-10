//
//  JHGradientNavigationController.m
//  JHGradientNavigationController
//
//  Created by HaoCold on 2020/1/10.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "JHGradientNavigationController.h"

@interface JHGradientNavigationController ()
@property (nonatomic,  assign) BOOL  statusBarFlag;
@end

@implementation JHGradientNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (_statusBarFlag) {
        return UIStatusBarStyleDefault;
    }
    return UIStatusBarStyleLightContent;
}

- (void)subViewDidScrollWithAlpha:(CGFloat)alpha
{
    [_jh_navigationBar setViewAlpla:alpha];
    if (alpha >= 1.0 && _statusBarFlag != YES) {
        _statusBarFlag = YES;
        [self setNeedsStatusBarAppearanceUpdate];
    }else if (alpha <= 0.0 && _statusBarFlag != NO){
        _statusBarFlag = NO;
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (JHGradientNavigationBar *)jh_navigationBar{
    if (!_jh_navigationBar) {
        _jh_navigationBar = [JHGradientNavigationBar navigatioinBar];
        _jh_navigationBar.ctrl = self;
    }
    return _jh_navigationBar;
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
