//
//  HHGradientLayerView.h
//  HHCommon
//
//  Created by yufeng on 2022/4/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHGradientLayerView : UIView

@property (nonatomic, copy) NSArray<UIColor *> *horizontalColorsArray;
@property (nonatomic, copy) NSArray<UIColor *> *verticalColorsArray;

//support autolayout
- (void)setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
