//
//  JHGradientNavigationBar.m
//  JHGradientNavigationController
//
//  Created by HaoCold on 2020/1/10.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "JHGradientNavigationBar.h"

static BOOL _iPhoneX;

@interface JHGradientNavigationBar()
@property (nonatomic,  strong) UIButton *backButton;
@property (nonatomic,  strong) UILabel *titleLabel;

@property (nonatomic,  strong) NSMutableArray *rightViews;
@property (nonatomic,  assign) BOOL  flag;
@end

@implementation JHGradientNavigationBar

+ (void)initialize{
    _iPhoneX = [self iPhoneX];
}

+ (instancetype)navigatioinBar{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = _iPhoneX ? 88 : 64;
    return [[JHGradientNavigationBar alloc] initWithFrame:CGRectMake(0, 0, width, height)];
}

+ (BOOL)iPhoneX{
    if ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return NO;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        if (window.safeAreaInsets.bottom > 0.0) {
            return YES;
        }
    }
    return NO;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _rightViews = @[].mutableCopy;
        _titleNormalColor = [UIColor whiteColor];
        _titleHighlightedColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        _buttonNormalImage = [UIImage imageNamed:@"btn_back_white"];
        _buttonHighlightedImage = [UIImage imageNamed:@"btn_back_black"];
        
        [self xjh_setupViews];
    }
    return self;
}

- (void)xjh_setupViews
{
    [self addSubview:self.backButton];
    [self addSubview:self.titleLabel];
}

#pragma mark -------------------------------------事件-------------------------------------------

- (void)backAction
{
    if (_ctrl.navigationController) {
        [_ctrl.navigationController popViewControllerAnimated:YES];
    }else{
        [_ctrl dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)setViewAlpla:(CGFloat)alpha
{
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:alpha];
    
    if (!_flag && alpha >= 1.0) {
        _flag = YES;
        _titleLabel.textColor = _titleHighlightedColor;
        [_backButton setImage:_buttonHighlightedImage forState:0];
        
        if (_alphaBlock) {
            _alphaBlock(self, YES);
        }
        
    }else if (_flag && alpha <= 0.0){
        _flag = NO;
        _titleLabel.textColor = _titleNormalColor;
        [_backButton setImage:_buttonNormalImage forState:0];
        
        if (_alphaBlock) {
            _alphaBlock(self, NO);
        }
    }
}

- (UIButton *)addButtonAtRight:(NSString *)imageName
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 44);
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:0];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }

    [self addCustomViewAtRight:button];
    
    return button;
}

- (void)addCustomViewAtRight:(UIView *)view
{
    [self addSubview:view];
    
    UIView *lastView = nil;
    if (_rightViews.count > 0) {
        lastView = [_rightViews lastObject];
    }
    
    CGFloat right = CGRectGetWidth(self.bounds) - 15;
    if (lastView) {
        right = CGRectGetMinX(lastView.frame);
    }
    
    CGRect frame = view.frame;
    frame.origin.x = right - frame.size.width;
    view.frame = frame;
    
    //
    CGFloat left = CGRectGetWidth(self.bounds) - CGRectGetMinX(view.frame);
    CGFloat width = CGRectGetWidth(self.bounds) - left*2;
    frame = _titleLabel.frame;
    frame.origin.x = left;
    frame.size.width = width;
    _titleLabel.frame = frame;
    
    [_rightViews addObject:view];
}

#pragma mark --- getter

- (UIButton *)backButton{
    if (!_backButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, _iPhoneX?44:20, 44, 44);
        [button setImage:_buttonNormalImage forState:0];
        [button addTarget:self action:@selector(backAction) forControlEvents:1<<6];
        _backButton = button;
    }
    return _backButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(44, _iPhoneX?44:20, CGRectGetWidth(self.bounds)-88, 44);
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:16];
        label.textAlignment = 1;
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
