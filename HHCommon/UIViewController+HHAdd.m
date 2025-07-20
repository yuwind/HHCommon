//
//  UIViewController+HHAdd.m
//  HHCommon
//
//  Created by yufeng on 2022/4/21.
//

#import "UIViewController+HHAdd.h"
#import "NSObject+HHAdd.h"
#import "UIWindow+HHAdd.h"

@implementation UIViewController (HHAdd)

+ (void)load {
    [self hh_swizzleMethodWithOriginal:@selector(viewWillAppear:) swizzled:@selector(log_viewWillAppear:)];
}

- (void)log_viewWillAppear:(BOOL)animated {
    [self log_viewWillAppear:animated];
    NSLog(@"==========%@", NSStringFromClass(self.class));
}

- (UIViewController *)hh_topViewController {
    return [self.class hh_topViewController];
}

+ (UIViewController *)hh_topViewController {
    return [self topViewControllerWithRootViewController:[UIWindow currentWindow].rootViewController];
}

+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

- (void)showAlertControllerWithStyle:(UIAlertControllerStyle)style title:(NSString *)title message:(NSString *)message actionArray:(NSArray<UIAlertAction *> *)actionArray {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    for (UIAlertAction *action in actionArray) {
        [alertVC addAction:action];
    }
    [self presentViewController:alertVC animated:true completion:nil];
}

@end
