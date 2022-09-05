//
//  HHGradientLayerButton.m
//  HHCommon
//
//  Created by yufeng on 2022/5/30.
//

#import "HHGradientLayerButton.h"

@implementation HHGradientLayerButton

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (void)setHorizontalColorsArray:(NSArray<UIColor *> *)horizontalColorsArray {
    _horizontalColorsArray = horizontalColorsArray;
    if (horizontalColorsArray.count == 0) {
        return;
    }
    NSMutableArray *arrayM = @[].mutableCopy;
    CGFloat total = horizontalColorsArray.count-1;
    for (NSInteger i = 0; i <= total; i++) {
        CGFloat index = i / total;
        [arrayM addObject:@(index)];
    }
    [self setGradientBackgroundWithColors:horizontalColorsArray locations:arrayM.copy startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
}

- (void)setVerticalColorsArray:(NSArray<UIColor *> *)verticalColorsArray {
    _verticalColorsArray = verticalColorsArray;
    if (verticalColorsArray.count == 0) {
        return;
    }
    NSMutableArray *arrayM = @[].mutableCopy;
    CGFloat total = verticalColorsArray.count-1;
    for (NSInteger i = 0; i <= total; i++) {
        CGFloat index = i / total;
        [arrayM addObject:@(index)];
    }
    [self setGradientBackgroundWithColors:verticalColorsArray locations:arrayM.copy startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
}

- (void)setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer;
    gradientLayer.colors = [self translateUIColorToCGColorWithArray:colors];
    gradientLayer.locations = locations;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
}

- (NSArray *)translateUIColorToCGColorWithArray:(NSArray *)colorArray {
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (UIColor *color in colorArray) {
        [mutableArray addObject:(__bridge id)color.CGColor];
    }
    return mutableArray.copy;
}

@end
