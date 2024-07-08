//
//  HHArrowLabel.h
//  HHCommonDemo
//
//  Created by huxuewei on 2024/7/8.
//

#import "HHArrowView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHArrowLabel : HHArrowView

@property (nonatomic, strong, readonly) UIView *contentView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, assign) BOOL shouldShowCorner;//default true
@property (nonatomic, assign) CGFloat cornerRadius;

@end

NS_ASSUME_NONNULL_END
