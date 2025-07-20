//
//  HHArrowLabel.h
//  HHCommonDemo
//
//  Created by huxuewei on 2024/10/7.
//

#import "HHArrowView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHArrowLabel : HHArrowView

@property (nonatomic, strong, readonly) UIView *contentView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
/// default true 与 cornerRadius互斥
@property (nonatomic, assign) BOOL shouldShowCorner;
/// default 8
@property (nonatomic, assign) CGFloat cornerRadius;
/// UIEdgeInsetsMake(7, 14, 7, 14)
@property (nonatomic, assign) UIEdgeInsets titleInsets;

@end

NS_ASSUME_NONNULL_END
