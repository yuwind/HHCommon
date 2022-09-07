//
//  UIView+HHArrange.h
//  HHCommon
//
//  Created by yufeng on 2022/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HHArrangeStyle) {
    HHArrangeHorizonal,
    HHArrangeVertical,
};

@interface UIView (HHArrange)

/**
 等比例设置子视图

 @param style 布局方向
 */
- (void)hh_arrangeSubviews:(HHArrangeStyle)style;

/**
 等比例设置子视图

 @param subViews 待布局子视图
 @param inset 内边距
 @param space 间距
 @param style 布局方向
 */
- (void)hh_arrangeSubviews:(NSArray <UIView *>*)subViews inset:(UIEdgeInsets)inset space:(CGFloat)space style:(HHArrangeStyle)style;

/**
 等比例设置ScrollView子视图
 
 @param subViews 待布局子视图
 @param inset 内边距
 @param widthOrHeight 固定的宽度或高度
 @param margin 间距
 @param style 布局方向
 */
- (void)hh_arrangeScrollViewSubviews:(NSArray <UIView *>*)subViews inset:(UIEdgeInsets)inset widthOrHeight:(CGFloat)widthOrHeight margin:(CGFloat)margin style:(HHArrangeStyle)style;

/**
 自动布局九空格

 @param array 待布局子视图
 @param totalWidth 总宽度
 @param itemHeight 子视图高度
 @param inset 内间距
 @param lineCount 列个数
 @param lineSpace 行间距
 @param margin 列间距
 */
- (void)hh_arrangeSubViews:(NSArray *)array totalWidth:(CGFloat)totalWidth itemHeight:(CGFloat)itemHeight inset:(UIEdgeInsets)inset lineCount:(NSInteger)lineCount lineSpace:(CGFloat)lineSpace margin:(CGFloat)margin;

@end

NS_ASSUME_NONNULL_END
