//
//  HHButton.h
//  HHCommonDemo
//
//  Created by huxuewei on 2023/8/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HHButtonStyle) {
    HHButtonStyleImageRight,
    HHButtonStyleImageLeft,
    HHButtonStyleImageTop,
    HHButtonStyleImageBottom,
};

@interface HHButton : UIView

@property (nonatomic, assign) CGFloat margin;//default 5
@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) BOOL shouldShowHorizonCorner;
@property (nonatomic, assign) BOOL shouldShowVerticalCorner;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UIImageView *iconImageView;

+ (instancetype)buttonWithStyle:(HHButtonStyle)style;
- (instancetype)initWithFrame:(CGRect)frame style:(HHButtonStyle)style;

@end

NS_ASSUME_NONNULL_END
