//
//  JHGradientNavigationController.h
//  JHGradientNavigationController
//
//  Created by HaoCold on 2020/1/10.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHGradientNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHGradientNavigationController : UIViewController
@property (nonatomic,  strong) JHGradientNavigationBar *jh_navigationBar;

- (void)subViewDidScrollWithAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
