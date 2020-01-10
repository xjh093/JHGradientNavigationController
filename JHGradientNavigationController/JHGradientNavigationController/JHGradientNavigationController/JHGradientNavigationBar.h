//
//  JHGradientNavigationBar.h
//  JHGradientNavigationController
//
//  Created by HaoCold on 2020/1/10.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class JHGradientNavigationBar;

typedef void(^JHGradientNavigationBarAlphaBlock)(JHGradientNavigationBar *bar, BOOL highlight);

@interface JHGradientNavigationBar : UIView

@property (nonatomic,  strong) UIColor *titleNormalColor;
@property (nonatomic,  strong) UIColor *titleHighlightedColor;
@property (nonatomic,    copy) UIImage *buttonNormalImage;
@property (nonatomic,    copy) UIImage *buttonHighlightedImage;

@property (nonatomic,    weak) UIViewController *ctrl;

@property (nonatomic,  strong,  readonly) UIButton *backButton;
@property (nonatomic,  strong,  readonly) UILabel *titleLabel;

@property (nonatomic,    copy) JHGradientNavigationBarAlphaBlock alphaBlock;

+ (instancetype)navigatioinBar;

/**
 设置透明度。
*/
- (void)setViewAlpla:(CGFloat)alpha;

/**
 在右侧添加按钮，先添加的在右侧。

 @return 返回创建的按钮。
 */
- (UIButton *)addButtonAtRight:(NSString *)imageName;

/**
 在右侧添加自定义视图，先添加的在右侧。
*/
- (void)addCustomViewAtRight:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
