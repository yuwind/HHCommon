//
//  HHButton.m
//  HHCommonDemo
//
//  Created by huxuewei on 2023/8/29.
//

#import "HHButton.h"
#import "UIView+HHLayout.h"
#import "UIView+HHFrame.h"
#import "HHMacro.h"

@interface HHButton ()

@property (nonatomic, assign) HHButtonStyle style;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *marginView;
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation HHButton

+ (instancetype)buttonWithStyle:(HHButtonStyle)style {
    return [[HHButton alloc] initWithFrame:CGRectZero style:style];
}

- (instancetype)initWithFrame:(CGRect)frame style:(HHButtonStyle)style {
    if (self = [super initWithFrame:frame]) {
        _style = style;
        _margin = mAdapter(6);
        _edgeInsets = UIEdgeInsetsMake(mAdapter(7), mAdapter(14), mAdapter(7), mAdapter(14));
        [self setupSubviews];
        [self setupConstraints];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame style:HHButtonStyleImageLeft];
}

- (void)setupSubviews {
    self.contentView = [UIView new];
    [self addSubview:self.contentView];
    self.contentView.userInteractionEnabled = false;
    
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.textColor = [UIColor darkTextColor];
    self.titleLabel.font = mSystemBoldFont(mAdapter(16));
    
    self.marginView = [UIView new];
    [self.contentView addSubview:self.marginView];
    
    self.iconImageView = [UIImageView new];
    [self.contentView addSubview:self.iconImageView];
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.shouldShowHorizonCorner) {
        self.layer.cornerRadius = self.height/2;
    }
    if (self.shouldShowVerticalCorner) {
        self.layer.cornerRadius = self.width/2;
    }
}

- (void)setMargin:(CGFloat)margin {
    _margin = margin;
    switch (self.style) {
        case HHButtonStyleImageRight:
        case HHButtonStyleImageLeft: {
            self.marginView.widthInset_(margin);
        }
            break;
        case HHButtonStyleImageTop:
        case HHButtonStyleImageBottom: {
            self.marginView.heightInset_(margin);
        }
            break;
        default:
            break;
    }
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
    _edgeInsets = edgeInsets;
    self.contentView.insetFrame_(edgeInsets);
}

- (void)setImageSize:(CGSize)imageSize {
    _imageSize = imageSize;
    self.iconImageView.sizeInset_(imageSize);
}

- (void)setupConstraints {
    self.contentView.insetFrame_(self.edgeInsets);
    switch (self.style) {
        case HHButtonStyleImageRight: {
            self.titleLabel.top_.left_.bott_.on_();
            
            self.marginView.leftOffset_(self.titleLabel, 0);
            self.marginView.top_.bott_.on_();
            self.marginView.widthInset_(self.margin);
            
            self.iconImageView.leftOffset_(self.marginView, 0);
            self.iconImageView.centY_.righ_.on_();
        }
            break;
        case HHButtonStyleImageLeft: {
            self.iconImageView.left_.centY_.on_();
            
            self.marginView.leftOffset_(self.iconImageView, 0);
            self.marginView.top_.bott_.on_();
            self.marginView.widthInset_(self.margin);
            
            self.titleLabel.leftOffset_(self.marginView, 0);
            self.titleLabel.top_.righ_.bott_.on_();
            
        }
            break;
        case HHButtonStyleImageTop: {
            self.iconImageView.top_.centX_.on_();
            
            self.marginView.topOffset_(self.iconImageView, 0);
            self.marginView.left_.righ_.on_();
            self.marginView.heightInset_(self.margin);
            
            self.titleLabel.topOffset_(self.marginView, 0);
            self.titleLabel.left_.righ_.bott_.on_();
        }
            break;
        case HHButtonStyleImageBottom: {
            self.titleLabel.top_.left_.righ_.on_();
            
            self.marginView.topOffset_(self.titleLabel, 0);
            self.marginView.left_.righ_.on_();
            self.marginView.heightInset_(self.margin);
            
            self.iconImageView.topOffset_(self.marginView, 0);
            self.iconImageView.bott_.centX_.on_();
        }
            break;
        default:
            break;
    }
}

@end
