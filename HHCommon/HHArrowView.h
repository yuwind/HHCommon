//
//  HHArrowView.h
//  HHCommonDemo
//
//  Created by huxuewei on 2022/9/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HHArrowDirection) {
    HHArrowDirectionTop,
    HHArrowDirectionLeft,
    HHArrowDirectionBottom,
    HHArrowDirectionRight
};

@interface HHArrowView : UIView

@property (nonatomic, strong) UIColor *fillColor;//default whiteColor
@property (nonatomic, assign) CGFloat arrowHeight;//default 12pt
@property (nonatomic, assign) CGFloat rate;//default 0.25
@property (nonatomic, assign) CGFloat angle;//default M_PI/2.5
@property (nonatomic, assign) HHArrowDirection direction;//default bottom

@end

NS_ASSUME_NONNULL_END
