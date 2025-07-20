//
//  HHArrowView.m
//  HHCommonDemo
//
//  Created by huxuewei on 2022/9/29.
//

#import "HHArrowView.h"
#import "HHMacro.h"

@implementation HHArrowView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _rate = 0.25;
        _angle = M_PI / 2.5;
        _arrowHeight = 12;
        _fillColor = [UIColor whiteColor];
        _direction = HHArrowDirectionBottom;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    bezierPath.lineWidth = 1/mScreenScale;
    CGPoint startPoint = CGPointZero;
    CGPoint firstPoint = CGPointZero;
    CGPoint secondPoint = CGPointZero;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    switch (self.direction) {
        case HHArrowDirectionTop: {
            CGFloat pointX = ceil(width * self.rate);
            CGFloat pointY = 0;
            CGFloat offset = ceil(tan(self.angle/2) * self.arrowHeight);
            startPoint = CGPointMake(pointX, pointY);
            firstPoint = CGPointMake(pointX-offset, self.arrowHeight);
            secondPoint = CGPointMake(pointX+offset, self.arrowHeight);
        }
            break;
        case HHArrowDirectionLeft: {
            CGFloat pointX = 0;
            CGFloat pointY = height * self.rate;
            CGFloat offset = tan(self.angle/2) * self.arrowHeight;
            startPoint = CGPointMake(pointX, pointY);
            firstPoint = CGPointMake(self.arrowHeight, pointY-offset);
            secondPoint = CGPointMake(self.arrowHeight, pointY+offset);
        }
            break;
        case HHArrowDirectionBottom: {
            CGFloat pointX = width * self.rate;
            CGFloat pointY = height;
            CGFloat offset = tan(self.angle/2) * self.arrowHeight;
            startPoint = CGPointMake(pointX, pointY);
            firstPoint = CGPointMake(pointX-offset, height - self.arrowHeight);
            secondPoint = CGPointMake(pointX+offset, height - self.arrowHeight);
        }
            break;
        case HHArrowDirectionRight: {
            CGFloat pointX = width;
            CGFloat pointY = height * self.rate;
            CGFloat offset = tan(self.angle/2) * self.arrowHeight;
            startPoint = CGPointMake(pointX, pointY);
            firstPoint = CGPointMake(width-self.arrowHeight, pointY-offset);
            secondPoint = CGPointMake(width-self.arrowHeight, pointY+offset);
        }
            break;
        default:
            break;
    }
    [bezierPath moveToPoint:startPoint];
    [bezierPath addLineToPoint:firstPoint];
    [bezierPath addLineToPoint:secondPoint];
    [bezierPath closePath];
    [self.fillColor set];
    [bezierPath fill];
}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    [self setNeedsDisplay];
}

- (void)setRate:(CGFloat)rate {
    _rate = rate;
    [self setNeedsDisplay];
}

- (void)setDirection:(HHArrowDirection)direction {
    _direction = direction;
    [self setNeedsDisplay];
}

@end
