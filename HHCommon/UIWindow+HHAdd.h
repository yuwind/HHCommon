//
//  UIWindow+ZJAdd.h
//  HHCommon
//
//  Created by huxuewei on 2025/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (HHAdd)

+ (nullable UIWindow *)currentWindow;
+ (nullable UIWindowScene *)currentWindowScene;

@end

NS_ASSUME_NONNULL_END
