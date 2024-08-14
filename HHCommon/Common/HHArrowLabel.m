//
//  HHArrowLabel.m
//  HHCommonDemo
//
//  Created by huxuewei on 2024/7/8.
//

#import "HHArrowLabel.h"
#import "HHArrowView.h"
#import "UIView+HHLayout.h"

@interface HHArrowLabel ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HHArrowLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.shouldShowCorner = true;
        self.rate = 0.5;
        [self setupSubviews];
        [self setupConstraints];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.shouldShowCorner) {
        self.contentView.layer.cornerRadius = self.contentView.frame.size.height/2;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    if (cornerRadius > 0) {
        self.shouldShowCorner = false;
        self.contentView.layer.cornerRadius = cornerRadius;
    } else {
        self.shouldShowCorner = true;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void)setShouldShowCorner:(BOOL)shouldShowCorner {
    _shouldShowCorner = shouldShowCorner;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setFillColor:(UIColor *)fillColor {
    [super setFillColor:fillColor];
    self.contentView.backgroundColor = fillColor;
}

- (void)setDirection:(HHArrowDirection)direction {
    [super setDirection:direction];
    switch (direction) {
        case HHArrowDirectionTop:
            self.contentView.insetFrame_(UIEdgeInsetsMake(8, 0, 0, 0));
            break;
        case HHArrowDirectionLeft:
            self.contentView.insetFrame_(UIEdgeInsetsMake(0, 8, 0, 0));
            break;
        case HHArrowDirectionBottom:
            self.contentView.insetFrame_(UIEdgeInsetsMake(0, 0, 8, 0));
            break;
        case HHArrowDirectionRight:
            self.contentView.insetFrame_(UIEdgeInsetsMake(0, 0, 0, 8));
            break;
        default:
            break;
    }
}

- (void)setupSubviews {
    self.contentView = [UIView new];
    [self addSubview:self.contentView];
    
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
}

- (void)setupConstraints {
    self.contentView.insetFrame_(UIEdgeInsetsMake(0, 0, 8, 0));
    self.titleLabel.insetFrame_(UIEdgeInsetsMake(6, 10, 6, 10));
}

@end
