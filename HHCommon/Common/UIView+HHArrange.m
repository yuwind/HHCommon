//
//  UIView+HHArrange.m
//  HHCommon
//
//  Created by yufeng on 2022/9/3.
//

#import "UIView+HHArrange.h"
#import "UIView+HHLayout.h"

@implementation UIView (HHArrange)

- (void)hh_arrangeSubviews:(HHArrangeStyle)style {
    [self hh_arrangeSubviews:self.subviews inset:UIEdgeInsetsZero space:0 style:style];
}

- (void)hh_arrangeSubviews:(NSArray<UIView *> *)subViews inset:(UIEdgeInsets)inset space:(CGFloat)space style:(HHArrangeStyle)style {
    UIView *preView = nil;
    if (style == HHArrangeHorizonal) {
        for (NSInteger i = 0; i < subViews.count; i++) {
            UIView *subView = subViews[i];
            if (i == 0) { subView.left_.top_.bott_.offsets_(@(inset.left),@(inset.top),@(-inset.bottom),nil).on_();
            }
            if (i == (subViews.count-1)) {
                if (preView) { subView.left_.top_.bott_.widt_.equalTo(preView.righ_).offset_(space).on_();
                    subView.righ_.offset_(-inset.right).on_();
                    subViews[0].widt_.equalTo(subView).on_();
                } else {
                    subView.righ_.offset_(-inset.right).on_();
                }
            } else if (preView) {
                subView.left_.top_.bott_.widt_.equalTo(preView.righ_).offset_(space).on_();
            }
            preView = subView;
        }
    } else if (style == HHArrangeVertical) {
        for (NSInteger i = 0; i < subViews.count; i++) {
            UIView *subView = subViews[i];
            if (i == 0) { subView.left_.top_.righ_.offsets_(@(inset.left),@(inset.top),@(-inset.right),nil).on_();
            }
            if (i == (subViews.count-1)) {
                if (preView) {
                    subView.top_.left_.righ_.heit_.equalTo(preView.bott_).offset_(space).on_();
                    subView.bott_.offset_(-inset.bottom).on_();
                    subViews[0].heit_.equalTo(subView).on_();
                } else {
                    subView.bott_.offset_(-inset.right).on_();
                }
            } else if (preView) { subView.top_.left_.righ_.heit_.equalTo(preView.bott_).offset_(space).on_();
            }
            preView = subView;
        }
    }
}

- (void)hh_arrangeScrollViewSubviews:(NSArray<UIView *> *)subViews inset:(UIEdgeInsets)inset widthOrHeight:(CGFloat)widthOrHeight margin:(CGFloat)margin style:(HHArrangeStyle)style{
    UIView *preView = nil;
    if (style == HHArrangeHorizonal) {
        for (NSInteger i = 0; i < subViews.count; i++) {
            UIView *subView = subViews[i];
            if (i == 0) { subView.left_.top_.bott_.offsets_(@(inset.left),@(inset.top),@(-inset.bottom),nil).on_();
                subView.widt_.offset_(widthOrHeight).on_();
                subView.centY_.on_();
            }
            if (i == (subViews.count-1)) {
                if (preView) { subView.left_.equalTo(preView.righ_).offset_(margin).on_();
                    subView.top_.bott_.centY_.equalTo(preView).on_();
                    subView.widt_.offset_(widthOrHeight).on_();
                    subView.righ_.offset_(-inset.right).on_();
                } else {
                    subView.righ_.offset_(-inset.right).on_();
                }
            } else if (preView) {
                subView.left_.equalTo(preView.righ_).offset_(margin).on_();
                subView.top_.bott_.widt_.centY_.equalTo(preView).on_();
            }
            preView = subView;
        }
    } else if (style == HHArrangeVertical) {
        for (int i = 0; i < subViews.count; i++) {
            UIView *subView = subViews[i];
            if (i == 0) { subView.left_.top_.righ_.offsets_(@(inset.left),@(inset.top),@(-inset.right),nil).on_();
                subView.heit_.offset_(widthOrHeight).on_();
                subView.centX_.on_();
            }
            if (i == (subViews.count-1)) {
                if (preView) {
                    subView.top_.equalTo(preView.bott_).offset_(margin).on_();
                    subView.left_.righ_.heit_.centX_.equalTo(preView).on_();
                    subView.bott_.offset_(-inset.bottom).on_();
                } else {
                    subView.bott_.offset_(-inset.right).on_();
                }
            } else if (preView) { subView.top_.equalTo(preView.bott_).offset_(margin).on_();
                subView.left_.righ_.heit_.centX_.equalTo(preView).on_();
            }
            preView = subView;
        }
    }
}

- (void)hh_arrangeSubViews:(NSArray *)array totalWidth:(CGFloat)totalWidth itemHeight:(CGFloat)itemHeight inset:(UIEdgeInsets)inset lineCount:(NSInteger)lineCount lineSpace:(CGFloat)lineSpace margin:(CGFloat)margin {
    CGFloat itemWidth = (totalWidth-inset.left-inset.right-(lineCount-1)*lineSpace)/lineCount;
    for (NSInteger i = 0; i<array.count; i++) {
        NSInteger row = i/lineCount;
        NSInteger column = i%lineCount;
        CGFloat xPosition = inset.left+column*(itemWidth+lineSpace);
        CGFloat yPosition = inset.top+row*(itemHeight+margin);
        UIView *view = array[i];
        view.topLeft_(CGRectMake(xPosition, yPosition, itemWidth, itemHeight));
        if (i == array.count-1) {
            view.bott_.offset_(-inset.bottom).on_();
        }
    }
}

@end
