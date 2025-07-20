//
//  UIWindow+ZJAdd.m
//  HHCommon
//
//  Created by huxuewei on 2025/1/22.
//

#import "UIWindow+HHAdd.h"
#import "NSObject+HHAdd.h"

@implementation UIWindow (HHAdd)

+ (UIWindowScene *)currentWindowScene {
    for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
        UIWindowScene *windowScene = (UIWindowScene *)[scene hh_as:UIWindowScene.class];
        if (windowScene.activationState == UISceneActivationStateForegroundActive) {
            return windowScene;
        }
    }
    return nil;
}

+ (UIWindow *)currentWindow {
    UIWindowScene *windowScene = [self currentWindowScene];
    id<UISceneDelegate> delegate = windowScene.delegate;
    if ([delegate respondsToSelector:@selector(window)]) {
        UIWindow *window = [delegate performSelector:@selector(window)];
        if (window) {
            return window;
        }
    }
    if (@available(iOS 15.0, *)) {
        UIWindow *keyWindow = windowScene.keyWindow;
        if (keyWindow) {
            return keyWindow;
        }
    }
    for (UIWindow *window in windowScene.windows) {
        if (window.isKeyWindow) {
            return window;
        }
    }
    return nil;
}

@end
