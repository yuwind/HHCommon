//
//  UIViewController+HHAdd.h
//  HHCommon
//
//  Created by yufeng on 2022/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HHAdd)

+ (UIViewController *)hh_topViewController;
- (UIViewController *)hh_topViewController;

/// show UIAlertController
- (void)showAlertControllerWithStyle:(UIAlertControllerStyle)style title:(nullable NSString *)title message:(nullable NSString *)message actionArray:(NSArray<UIAlertAction *> *)actionArray;

@end

NS_ASSUME_NONNULL_END
