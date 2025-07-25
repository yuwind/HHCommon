//
//  HHMacro.h
//  HHCommon
//
//  Created by yufeng on 2022/4/21.
//

#import <UIKit/UIkit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 屏幕尺寸

#define mScreenScale ([UIScreen mainScreen].scale)
#define mScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define mIs4_0InchScreen (mScreenHeight == 568)
#define mIs4_7InchScreen (mScreenHeight == 667)
#define mIs5_4InchScreen (mScreenHeight == 812 && mScreenWidth == 375)
#define mIs5_5InchScreen (mScreenHeight == 736)
#define mIs5_8InchScreen (mScreenHeight == 812 && mScreenWidth == 375)
#define mIs6_1InchScreen ((mScreenHeight == 896 && mScreenWidth == 414) || (mScreenHeight == 844 && mScreenWidth == 390) || (mScreenHeight == 852 && mScreenWidth == 393))
#define mIs6_3InchScreen (mScreenHeight == 874 && mScreenWidth == 402)
#define mIs6_5InchScreen (mScreenHeight == 896 && mScreenWidth == 414)
#define mIs6_7InchScreen ((mScreenHeight == 926 && mScreenWidth == 428) || (mScreenHeight == 932 && mScreenWidth == 430))
#define mIs6_9InchScreen (mScreenHeight == 956 && mScreenWidth == 440)

#define mIsLargeThan4Inch (mScreenWidth >= 375)
#define mAdapter(value) floor((value) * MIN(mScreenWidth, mScreenHeight) / 375.0f)

#define mAvailableWindow [UIWindow currentWindow]

#define mSystemSafeAreaInsets    mSafeAreaInsets(mAvailableWindow)
#define mSafeAreaInsets(view) ({UIEdgeInsets i; if(@available(iOS 11.0, *)) {if ([UIDevice currentDevice].systemVersion.integerValue == 11) {if (mIsIphoneX) {i = view.safeAreaInsets;} else {i = UIEdgeInsetsMake(20, 0, 0, 0);}} else {i = view.safeAreaInsets;}} else {i = UIEdgeInsetsMake(20, 0, 0, 0);} i;})

#define mIsIphoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
    isPhoneX = mAvailableWindow.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define mNavigationBarHeight 44
//#define mStatusBarHeight ({CGFloat statusBarHeight;if (@available(iOS 13.0, *)) {\
//UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;\
//statusBarHeight = statusBarManager.statusBarFrame.size.height;\
//} else { statusBarHeight = mSystemSafeAreaInsets.top; } statusBarHeight;})

#define mStatusBarHeight ({UIStatusBarManager *statusBarManager = [UIWindow currentWindowScene].statusBarManager;\
CGFloat statusBarHeight = statusBarManager.statusBarFrame.size.height;\
statusBarHeight;})


#define mNavigationBarAndStatusBarHeight (mNavigationBarHeight + mStatusBarHeight)
#define mTabBarHeight 49
#define mIndicatorHeight mSystemSafeAreaInsets.bottom
#define mTabBarAndIndicatorHeight (mTabBarHeight + mSystemSafeAreaInsets.bottom)

#pragma mark - 生成颜色
#define mRGBColor(r, g, b) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1.0]
#define mRGBAColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)]
#define mRGBCGColor(r, g, b) mRGBColor(r, g, b).CGColor
#define mRGBACGColor(r, g, b, a) mRGBAColor(r, g, b, a).CGColor
#define mRGBCGColorToBridge(r,g,b) (__bridge id)mRGBCGColor(r, g, b)
#define mRGBACGColorToBridge(r,g,b,a) (__bridge id)mRGBACGColor(r, g, b, a)

#define UIColor16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFrom16(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#pragma mark - 生成字体
#define mSystemFont(size) [UIFont systemFontOfSize:(size)]
#define mSystemBoldFont(size) [UIFont boldSystemFontOfSize:(size)]
#define mSystemLightFont(size) [UIFont systemFontOfSize:(size) weight:UIFontWeightLight]
#define mSystemMediumFont(size) [UIFont systemFontOfSize:(size) weight:UIFontWeightMedium]
#define mSystemSemiboldFont(size) [UIFont systemFontOfSize:(size) weight:UIFontWeightSemibold]
#define mSystemItalicFont(size) [UIFont italicSystemFontOfSize:(size)]
#define mCustomFont(name, fontSize) [UIFont fontWithName:(name) size:(fontSize)]

#define HHCLAMP(val, min, max) MIN(MAX(val, min), max)

#if DEBUG
#define hh_keywordify autoreleasepool {}
#else
#define hh_keywordify try {} @catch (...) {}
#endif

#define weakly(var) hh_keywordify __weak __typeof(var) __weak__##var = var;
#define strongly(var) hh_keywordify __strong typeof(var) var = __weak__##var;

NS_ASSUME_NONNULL_END
