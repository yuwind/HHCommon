//
//  HHFormatUtil.h
//  HHCommon
//
//  Created by huxuewei on 2024/8/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHFormatUtil : NSObject

/// 浮点数格式化
/// - Parameter value: 浮点数
+ (NSString *)zeroDecimalStringWithValue:(CGFloat)value;
+ (NSString *)maxOneDecimalStringWithValue:(CGFloat)value;
+ (NSString *)maxTwoDecimalStringWithValue:(CGFloat)value;
+ (BOOL)isZeroDecimalWithValue:(CGFloat)value;
+ (BOOL)isOneDecimalWithValue:(CGFloat)value;

/// 单个标签
+ (NSAttributedString *)getHighlightAttribute:(NSString *)str withDefont:(UIFont *)defont withDefTextColor:(UIColor *)defColor withHighFont:(UIFont *)highFont withHighColor:(UIColor *)highColor withAlignment:(NSTextAlignment)alignment;

/// 多个标签
+ (NSAttributedString *)getHighlightAttribute:(NSString *)str withDefont:(UIFont *)defont withDefTextColor:(UIColor *)defColor withHighFont:(UIFont *)highFont withHighColor:(UIColor *)highColor withAlignment:(NSTextAlignment)alignment withTempArribute:(NSMutableAttributedString *)tempArribute;

@end

NS_ASSUME_NONNULL_END
