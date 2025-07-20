//
//  HHArrowLabel.m
//  HHCommonDemo
//
//  Created by huxuewei on 2024/10/7.
//

#import "HHArrowLabel.h"

@interface HHArrowLabel ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;
@property (nonatomic, strong) NSLayoutConstraint *leftConstraint;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;
@property (nonatomic, strong) NSLayoutConstraint *rightConstraint;
@property (nonatomic, copy) NSArray<NSLayoutConstraint *> *titleHConstraints;
@property (nonatomic, copy) NSArray<NSLayoutConstraint *> *titleVConstraints;

@end

@implementation HHArrowLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.rate = 0.5;
        self.cornerRadius = 8;
        self.shouldShowCorner = true;
        [self setupSubviews];
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

- (void)setArrowHeight:(CGFloat)arrowHeight {
    [super setArrowHeight:arrowHeight];
    [self layoutContentView];
}

- (void)setDirection:(HHArrowDirection)direction {
    [super setDirection:direction];
    [self layoutContentView];
}

- (void)setupSubviews {
    self.contentView = [UIView new];
    [self addSubview:self.contentView];
    self.contentView.layer.cornerRadius = self.cornerRadius;
    
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.topConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraint:self.topConstraint];
    self.leftConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraint:self.leftConstraint];
    self.bottomConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-self.arrowHeight+2];
    [self addConstraint:self.bottomConstraint];
    self.rightConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    [self addConstraint:self.rightConstraint];
    
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleInsets = UIEdgeInsetsMake(7, 14, 7, 14);
}

- (void)setTitleInsets:(UIEdgeInsets)titleInsets {
    _titleInsets = titleInsets;
    if (self.titleHConstraints) {
        [self.contentView removeConstraints:self.titleHConstraints];
    }
    if (self.titleVConstraints) {
        [self.contentView removeConstraints:self.titleVConstraints];
    }
    
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *titleDictionary = NSDictionaryOfVariableBindings(_titleLabel);
    NSString *hFormat = [NSString stringWithFormat:@"H:|-%lf-[_titleLabel]-%lf-|", titleInsets.left, titleInsets.right];
    self.titleHConstraints = [NSLayoutConstraint constraintsWithVisualFormat:hFormat options:0 metrics:nil views:titleDictionary];
    [self.contentView addConstraints:self.titleHConstraints];
    
    NSString *vFormat = [NSString stringWithFormat:@"V:|-%lf-[_titleLabel]-%lf-|", titleInsets.top, titleInsets.bottom];
    self.titleVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:vFormat options:0 metrics:nil views:titleDictionary];
    [self.contentView addConstraints:self.titleVConstraints];
}

- (void)layoutContentView {
    UIEdgeInsets contentInset = UIEdgeInsetsZero;
    switch (self.direction) {
        case HHArrowDirectionTop:
            contentInset.top = self.arrowHeight-2;
            break;
        case HHArrowDirectionLeft:
            contentInset.left = self.arrowHeight-2;
            break;
        case HHArrowDirectionBottom:
            contentInset.bottom = self.arrowHeight-2;
            break;
        case HHArrowDirectionRight:
            contentInset.right = self.arrowHeight-2;
            break;
        default:
            break;
    }
    self.topConstraint.constant = contentInset.top;
    self.leftConstraint.constant = contentInset.left;
    self.bottomConstraint.constant = -contentInset.bottom;
    self.rightConstraint.constant = -contentInset.right;
}

@end
